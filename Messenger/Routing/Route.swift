//
//  Route.swift
//  Messenger
//
//  Created by Adarsh Begur on 25/07/24.
//

import Foundation

enum Route: Hashable{
    case Profile(User)
    case chatView(User)
}
