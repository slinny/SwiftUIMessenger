//
//  MessageItems+Types.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 5/4/25.
//

import Foundation

enum AdminMessageType: String {
    case channelCreation
    case memberAdded
    case memberLeft
    case channelNameChanged
}

enum MessageType {
    case text, photo, video, audio
    
    var title: String {
        switch self {
        case .text:
            return "text"
            
        case .photo:
            return "photo"

        case .video:
            return "video"

        case .audio:
            return "audio"

        }
    }
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}
