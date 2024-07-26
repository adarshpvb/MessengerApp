//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Adarsh Begur on 21/07/24.
//

import Foundation
import Firebase

class ChatViewModel: ObservableObject{
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let service: ChatService
    
    init(user: User){
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    func observeMessages(){
        service.observeMessages() {  messages in
            self.messages.append(contentsOf: messages)
        }
    }
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
