//
//  MenuGridView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/23/24.
//

import SwiftUI

struct MenuGridView: View {
    @State private var favorites:[Int]  = [-1]
    @Binding var selectedItem:MenuItem

    func menu(id:Int) ->MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    var menu:[MenuItem]
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let columnLayout2 = Array(repeating: GridItem(), count: 5)
    
    @Namespace private var nspace
    
    var body: some View {
        
        VStack {
            LazyVGrid(columns: columnLayout2) {
                
                ForEach(favorites.sorted(),id: \.self){ item in
                    FavoriteTileView(menuItem: menu(id: item))
                        .matchedGeometryEffect(id: item, in: nspace)
                        .onLongPressGesture {
                            if let index = favorites.firstIndex(where: {$0 == item }){
                                favorites.remove(at: index)
                            }
                        }
                        .onTapGesture {
                            selectedItem = menu(id: item)
                        }
                    
                }
            }
            
            Text(selectedItem.name)
                .font(.headline)
            ScrollView {
                LazyVGrid(columns: columnLayout){
                    ForEach(menu){ item in
                        if !favorites.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .onTapGesture(count: 2){
                                    if !favorites.contains(item.id){
                                        withAnimation(.easeInOut) {
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                }
                        }
                    }
                }
            }
        }
        .animation(.easeOut(duration: 0.5), value: favorites)
    }
}

#Preview {
    MenuGridView(selectedItem: .constant(testMenuItem), menu: MenuModel().menu)
}
