//
//  MessageItem.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 12/23/24.
//


import SwiftUI

struct MessageItem: Identifiable {
    let id = UUID().uuidString
    let text: String
    let direction: MessageDirection
    
    static let sentPlaceholder = MessageItem(text: "Holy Spagetti", direction: .sent)
    static let receivedPlaceholder = MessageItem(text: "Hey Dude whats up ", direction: .received)

    var alignment: Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
    
    var foregroundColor: Color {
        return direction == .sent ? .white : .black
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .blue : .gray
    }
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}
