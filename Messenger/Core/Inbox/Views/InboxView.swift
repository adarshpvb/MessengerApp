//
//  InboxView.swift
//  Messenger
//
//  Created by Adarsh Begur on 30/05/24.
//

import SwiftUI

struct InboxView: View {
    @State private var showMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var  showChat = false
     
    private var user: User?{
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack{
                List{
                    ActiveNowView()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical)
                        .padding(.horizontal, 4)
                    ForEach(viewModel.recentMessages){message in
                        ZStack {
                            NavigationLink(value: message) {
                                EmptyView()
                            }.opacity(0.0)
                            InboxRowView(message: message)
                        }
                    }
                }
                .navigationTitle("Chats")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
            .onChange(of: selectedUser, { oldValue, newValue in
                showChat = newValue != nil 
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user{
                    ChatView(user:user)
                }
            })
            .navigationDestination(for: Route.self, destination: { Route in
                switch Route {
                case .Profile(let user):
                    ProfileView(user:user)
                case .chatView(let user):
                    ChatView(user: user)
                }
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser{
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    HStack{
                        if let user{
                            NavigationLink(value: Route.Profile(user)) {
                                CircularProfileImageView(user: user, size: .xSmall )
                            }
                        }
                      
//                        Text("Chats")
//                            .font(.footnote)
//                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showMessageView.toggle()
                        selectedUser = nil
                    }
                label: {
                    Image(systemName: "square.and.pencil.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.black, Color(.systemGray5))
                    
                }
                }
                }
            }
        }
    }


#Preview {
    InboxView()
}
