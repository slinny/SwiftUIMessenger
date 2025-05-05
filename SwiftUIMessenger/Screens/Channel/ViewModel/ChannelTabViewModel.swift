//
//  ChannelTabViewModel.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/29/25.
//

import Foundation
import Firebase
import FirebaseAuth

final class ChannelTabViewModel: ObservableObject {
    
    @Published var navigateToChatRoom = false
    @Published var newChannel: ChannelItem?
    @Published var showChatPartnerPickerView = false
    @Published var channels = [ChannelItem]()
    typealias ChannelId = String
    @Published var channelDictionary: [ChannelId: ChannelItem] = [:]
    
    init() {
        fetchCurrentUserChannels()
    }
    
    func onNewChannelCreation(_ channel: ChannelItem) {
        showChatPartnerPickerView = false
        newChannel = channel
        navigateToChatRoom = true
    }
    
    private func fetchCurrentUserChannels() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        FirebaseConstants.UserChannelsRef.child(currentUid).observe(.value) {[weak self] snapshot in
            guard let dict = snapshot.value as? [String: Any] else { return }
            dict.forEach { key, value in
                let channelId = key
                self?.getChannel(with: channelId)
            }
        } withCancel: { error in
            print("Failed to get the current user's channelIds: \(error.localizedDescription)")
        }
    }
    
    private func getChannel(with channelId: String) {
        FirebaseConstants.ChannelsRef.child(channelId).observe(.value) {[weak self] snapshot in
            guard let dict = snapshot.value as? [String: Any] else { return }
            var channel = ChannelItem(dict)
            self?.getChannelMembers(channel) { members in
                channel.members = members
                self?.channelDictionary[channelId] = channel
                self?.reloadData()
//                self?.channels.append(channel)
                print("channel: \(channel.title)")
            }
        } withCancel: { error in
            print("Failed to get the channel for id \(channelId): \(error.localizedDescription)")
        }
    }
    
    private func getChannelMembers(_ channel: ChannelItem, completion: @escaping (_ members: [UserItem]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let channelMembersUids = Array(channel.membersUids.filter { $0 != currentUid }.prefix(2))
        UserService.getUsers(with: channelMembersUids) { userNode in
            completion(userNode.users)
        }
    }
    
    private func reloadData() {
        self.channels = Array(channelDictionary.values)
        self.channels.sort { $0.lastMessageTimeStamp > $1.lastMessageTimeStamp }
    }
}
