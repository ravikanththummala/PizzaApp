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
            NavigationStack {
                List{
                    ForEach(orders.orderItems){ order in
                        
                        NavigationLink(value:order) {
                            OrderRowView(order:order)
                                .padding(4)
                                .background(.regularMaterial,in: RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding(.bottom,5)
                                .padding([.leading,.trailing],7)
                        }
                        .navigationDestination(for: OrderItem.self) { orderValu in
                            OrderDetailView(orderItem:.constant(orderValu), presentSheet: .constant(false), newOrder: .constant(false))
                        }
                        .navigationTitle("Your Order")
                        
                    }
                    .onDelete{ indexSet in

                        orders.orderItems.remove(atOffsets: indexSet)
                    }
                    .onMove{ source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
            .padding(.top,70)
        }
        .background(Color("Surf"))
        
    }
}


#Preview {
    OrderView(orders: OrderModel())
}
