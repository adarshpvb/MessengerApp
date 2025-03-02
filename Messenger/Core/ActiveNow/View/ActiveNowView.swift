//
//  ActiveNowView.swift
//  Messenger
//
//  Created by Adarsh Begur on 31/05/24.
//

import SwiftUI

struct ActiveNowView: View {
     @StateObject var viewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32){
                ForEach(viewModel.users){user in
                    NavigationLink(value: Route.chatView(user)) {
                        VStack{
                            ZStack(alignment: .bottomTrailing){
                                CircularProfileImageView(user:user, size: .medium)
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
