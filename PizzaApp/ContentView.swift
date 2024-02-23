//
//  ContentView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    
    var menu:[MenuItem]
    @StateObject var orders:OrderModel = OrderModel()
    @State private var showOrders:Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    
    var body: some View {
        VStack {
            
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme,.light)
            
            StatusBarView(showOrders: $showOrders)
            
            if showOrders{
                OrderView(orders: orders)
                    .cornerRadius(10)
            }else{
                MenuItemView(selectededItem: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                MenuView(menu:MenuModel().menu, selectededItem: $selectedItem)
            }
        }
        .padding()
        .background(.linearGradient(colors:[.cyan, Color("Surf"),Color("Sky"),.white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
        
}


