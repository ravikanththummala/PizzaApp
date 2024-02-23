//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

@main
struct PizzaAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu:MenuModel().menu)
        }
    }
}
