//
//  ChannelTabViewModel.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/29/25.
//

import Foundation

final class ChannelTabViewModel: ObservableObject {
    
    @Published var navigateToChatRoom = false
    @Published var newChannel: ChannelItem?
    @Published var showChatPartnerPickerView = false
    
    func onNewChannelCreation(_ channel: ChannelItem) {
        showChatPartnerPickerView = false
        newChannel = channel
        navigateToChatRoom = true
    }
}
