//
//  ChatRow.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import SwiftUI

struct ChatRow: View {
    var message : Message
    
    
    var body: some View {
        Group{
            if message.role == .system || message.role == .assistant{
                HStack{
                    Text(message.content).font(.footnote)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(.gray).cornerRadius(10)
                    Spacer()
                }.padding(.horizontal, 1)
            }else if message.role == .user{
                HStack{
                    Spacer()
                    Text(message.content).font(.footnote)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(.green).cornerRadius(10)
                }.padding(.horizontal, 1)
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: Message(role: .user, content: "bu bir test mesajı"))
    }
}
