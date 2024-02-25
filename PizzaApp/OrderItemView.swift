//
//  OrderItemView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/23/24.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem:OrderItem
    @State private var quantity = 1
    @State private var doubleIngredient = false
    @State var pizzaCrust:PizzaCrust
    @State private var name:String = ""
    @State private var comments:String = ""

    init(orderItem:Binding<OrderItem>){
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }

    var body: some View {

        VStack{
            
            TextField("Name",text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $doubleIngredient){
                Text("Double Ingredient "  + (doubleIngredient ? "Yes" : "No"))
                Stepper(value: $quantity, in: 1...10) {
                    Text("\(quantity) " + (quantity == 1 ? "Pizza" : "Pizzas"))
                }
                
            }
                
                Picker(selection: $pizzaCrust) {
                    ForEach(PizzaCrust.allCases,id: \.self){ crust in
                        Text(crust.rawValue).tag(crust)
                    }
                } label: {
                    
                    Text("Pizze Crust")
                }
                .pickerStyle(.menu)
                
                VStack {
                    Text("Comments")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    TextEditor(text: $comments)
                }
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .shadow(radius: 1)
                    
                Spacer()
                
            }
        .padding()
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
