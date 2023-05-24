//
//  CompletionService.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import Foundation

class CompletionService {
    
    func sendAsk(message: [Message], completion: @escaping (Result<Completion, Error>) -> Void){
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(Params().token)"
        ]
    
        
        let sendCompletion = SendCompletion(model: "gpt-3.5-turbo", messages: message)
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        
        do {
            let data = try encoder.encode(sendCompletion)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = data
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }else{
                    guard let data = data else {
                        completion(.failure(NSError(domain: "No data in response", code: 0, userInfo: nil)))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let chatCompletionResponse = try decoder.decode(Completion.self, from: data)
                        completion(.success(chatCompletionResponse))

                    } catch let error {
                        print("Error decoding response: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
                }
            }
            
            task.resume()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
