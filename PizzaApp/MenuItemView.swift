//
//  MenuItemView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem:Bool = false
    @Binding var selectededItem: MenuItem
    @ObservedObject var orders:OrderModel
    
    var body: some View {
        VStack {
            
            HStack {
                Text(selectededItem.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                    .frame(minWidth: 150,maxWidth: 1000, maxHeight:150)
                
                
                if let image = UIImage(named: "\(selectededItem.id)_lg") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom],5)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                else{
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                }
                
            }
            .background(.linearGradient(colors: [Color("Surf"),Color("Sky")], startPoint: .leading, endPoint: .bottomTrailing), in: Capsule())
            .shadow(color:.cyan.opacity(0.5),radius: 5, x: 8,y: 8)
            
            
            VStack(alignment:.leading) {
                
                ScrollView {
                    Text(selectededItem.description)
                        .font(.custom("Georgia", size: 18,relativeTo: .body))
                }
                
            }
            Button {
                addedItem = true
                orders.addOrder(selectededItem, quantity: 1)
            } label: {
                Spacer()
                
                Text(selectededItem.price,format: .currency(code: "USD")).bold()
                Image(systemName: addedItem ?  "cart.fill.badge.plus" : "cart.badge.plus")
                Spacer()
            }
            .disabled(selectededItem.id < 0)
            .padding()
            .background(.red, in: Capsule())
            .foregroundStyle(.white)
            .padding(5)
            
        }
    }
}

#Preview {
    MenuItemView(selectededItem: .constant(testMenuItem), orders: OrderModel())
}
