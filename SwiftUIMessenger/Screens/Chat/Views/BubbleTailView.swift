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
        return direction == .received ? .gray : .blue
    }
    
    var body: some View {
        Image(systemName: direction == .sent ? "arrow.uturn.forward" : "arrow.uturn.backward")
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
