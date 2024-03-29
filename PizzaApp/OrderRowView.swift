//
//  OrderRowView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI


struct OrderRowView: View {
    
    @State var order:OrderItem
    
    var body: some View {
        VStack {
            HStack {
                Text(order.item.name)
                Text("-" + order.preferredCrust.rawValue)
                if order.extraIngredients {
                    Image(systemName: "2.circle")
                }
                Spacer()
                Text(order.name)
            }

            HStack(alignment:.firstTextBaseline){
                Text(order.quantity,format: .number)
                Text(order.item.price.formatted(.currency(code: "USD")))
                Spacer()
                Text(order.extPrice.formatted(.currency(code: "USD")))
                    .fontWeight(.semibold)
            }
        }
    }
}

//#Preview {
//    OrderRowView(order: )
//}
