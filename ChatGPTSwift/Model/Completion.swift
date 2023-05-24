//
//  Completion.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import Foundation

class Completion: Codable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let usage: Usage
    let choices: [Choice]
    
}

struct Usage: Codable {
    let prompt_tokens: Int
    let completion_tokens: Int
    let total_tokens: Int
}

struct Choice: Codable {
    let message: Message
    let finish_reason: String
    let index: Int
        
}
struct Message: Codable, Hashable{
    let role: Role
    let content: String

}


enum Role: String, Codable {
    case user
    case system
    case assistant
}

struct SendCompletion: Codable {
    let model: String
    let messages: [Message]
}
