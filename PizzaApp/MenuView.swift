//
//  MenuView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

struct MenuView: View {
    var menu:[MenuItem]
    @Binding var selectededItem: MenuItem
    
    var body: some View {
        List(MenuCategory.allCases,id: \.self){ category in
            
            Section {
                ForEach(menu.filter({$0.category == category})) { item in
                    MenuRowView(item: item)
                        .onTapGesture {
                            selectededItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
}

#Preview {
    MenuView(menu: MenuModel().menu, selectededItem: .constant(testMenuItem))

}
