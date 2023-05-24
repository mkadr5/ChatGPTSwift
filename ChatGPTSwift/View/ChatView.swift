//
//  ChatView.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import SwiftUI


struct ChatView: View {
    
    @State var message = ""
    @StateObject var viewModel = CompletionViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .trailing) {
                ScrollView{
                    ForEach(viewModel.messageHistory, id: \.self){item in
                        ChatRow(message: item)
                    }
                }
                
                HStack{
                    TextField("Ask me anything...",text: $message).frame(minHeight: 30).padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(23)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "paperplane")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
                }.padding()
            }.navigationBarTitle(Text("Chat AI"))
        }
        
    }
    
    func sendMessage() {
        
        guard !message.isEmpty else { return }
        
        viewModel.sendAsk(message: message) { result in
            switch result{
            case .success(let mes):
                print(viewModel.messageHistory)
            case .failure:
                print("error")
            }
            
        }
        message = ""
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
