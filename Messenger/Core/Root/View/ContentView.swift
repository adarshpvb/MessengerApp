//
//  ContentView.swift
//  Messenger
//
//  Created by Adarsh Begur on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                InboxView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
