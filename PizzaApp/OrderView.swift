//
//  OrderView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var orders:OrderModel

    var body: some View {
        VStack {
            ZStack(alignment:.top){
                
                ScrollView {
                    
                    ForEach(orders.orderItems,id: \.id){ order in
                        
                        OrderRowView(order:order)
                            .padding(4)
                            .background(.regularMaterial,in: RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding(.bottom,5)
                            .padding([.leading,.trailing],7)
                    }
                }
                .padding(.top,70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Label(title: { Text(orders.orderTotal,format: .currency(code: "USD")) },
                          icon: { Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")})
                }
                .padding()
                .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))

            }
            .padding()
        
            Button("Delete Order "){
                if !orders.orderItems.isEmpty{
                    orders.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial,in: Capsule())
            .padding(7)
            
        }
        .background(Color("Surf"))

    }
}


#Preview {
    OrderView(orders: OrderModel())
}
