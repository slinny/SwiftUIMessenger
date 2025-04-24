//
//  ChatPartnerRowView.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/24/25.
//

import SwiftUI

struct ChatPartnerRowView: View {
    let user: UserItem
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .bold()
                
                Text(user.bioUnwrapped)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ChatPartnerRowView(user: .placeholder)
}
