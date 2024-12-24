//
//  BubbleTailView.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 12/23/24.
//


import SwiftUI

struct BubbleTailView: View {
    var direction: MessageDirection
    
    private var backgroundColor: Color {
        return direction == .received ? .gray.opacity(0.2) : .blue.opacity(0.1)
    }
    
    var body: some View {
        Image(systemName: direction == .sent ? "bubble.right.fill" : "bubble.left.fill")
            .renderingMode(.template)
            .resizable()
            .frame(width: 10, height: 10)
            .offset(y: 3)
            .foregroundStyle(backgroundColor)
    }
}

#Preview {
    ScrollView {
        BubbleTailView(direction: .sent)
        BubbleTailView(direction: .received)
    }
    .frame(maxWidth: .infinity)
    .background(Color.gray.opacity(0.1))
}
