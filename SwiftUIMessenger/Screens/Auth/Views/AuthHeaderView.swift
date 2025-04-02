//
//  AuthHeaderView.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/2/25.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.line.dotted.person")
                .resizable()
                .frame(width: 60, height: 30)
                .foregroundColor(.white)
            
            Text("Messenger")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    AuthHeaderView()
}
