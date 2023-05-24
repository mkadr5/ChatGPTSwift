//
//  CompletionViewModel.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import Foundation

class CompletionViewModel : ObservableObject {
    private let service: CompletionService
    @Published var messageHistory: [Message] = []
    
    init(service: CompletionService = CompletionService()) {
        self.service = service
    }
    func sendAsk(message: String, completion: @escaping (Result<Message, Error>) -> Void) {
        let userMessage = Message(role: .user, content: "\(message)")
        self.messageHistory.append(userMessage)
        service.sendAsk(message: self.messageHistory) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if response.choices.count > 0{
                        self.messageHistory.append(response.choices.first!.message)
                        completion(.success(response.choices.first!.message))
                    }
                    completion(.success(response.choices.first!.message))
                case .failure(let error):
                   // self.messageHistory.append("Error: \(error.localizedDescription)\n")
                    completion(.failure(error))
                }
            }
            
        }
    }
}
