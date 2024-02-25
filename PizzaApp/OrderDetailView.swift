//
//  OrderDetailView.swift
//  OrderDetailView
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

struct OrderDetailView: View {
    @Binding var orderItem:OrderItem
    @Binding var presentSheet:Bool
    @Binding var newOrder:Bool
    
    @State private var quantity:Int
    @State private var doubleIngredient:Bool
    @State private var pizzaCrust:PizzaCrust
    @State private var name:String
    @State private var comments:String
    @State private var presentAlert:Bool = false

    @EnvironmentObject var orders:OrderModel
    
    init(orderItem:Binding<OrderItem>,presentSheet:Binding<Bool>,newOrder:Binding<Bool>){
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.preferredCrust.wrappedValue
        self.quantity = Int(orderItem.quantity.wrappedValue)
        self.doubleIngredient = orderItem.extraIngredients.wrappedValue
        self.name = orderItem.name.wrappedValue
        self.comments = orderItem.comments.wrappedValue
        self._presentSheet = presentSheet
        self._newOrder = newOrder
    }
    
    
    func updateOrder(){
        orderItem.quantity = quantity
        orderItem.extraIngredients = doubleIngredient
        orderItem.name = name
        orderItem.preferredCrust = pizzaCrust
        orderItem.comments = comments
    }
        
    var body: some View {
        VStack{
            HStack {
                if let image = UIImage(named: "\(orderItem.item.id)_lg"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom],5)
                        .cornerRadius(15)
                        
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        
                }
                Text(orderItem.item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.trailing)
            }
            .background(.linearGradient(colors: [Color("Surf"),Color("Sky")], startPoint: .leading, endPoint: .trailing), in:Capsule())
            
          
            TextField("Mark this pizza for", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            VStack{
                Picker(selection: $pizzaCrust) {
                    ForEach(PizzaCrust.allCases,id:\.self){crust in
                        Text(crust.rawValue).tag(crust)
                    }
                } label: {
                    Text("Pizza Crust" + pizzaCrust.rawValue)
                    
                }
                
                .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(.black)
                .background(.ultraThickMaterial)
                
                Toggle(isOn: $doubleIngredient){
                    Text((doubleIngredient ? "Double Toppings" : "Single Toppings"))
                }
                
                Stepper(value: $quantity, in: 1...10 ){
                    Text("\(quantity) " + (quantity == 1 ? "pizza" : "pizzas"))
                }
            }
            .padding(5)
            .background(.regularMaterial)
            .cornerRadius(3)
            
                Text("Comments").font(.caption).foregroundColor(.secondary)
                TextEditor(text:$comments)
                    .frame(maxHeight:200)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .shadow(radius: 1)
            Spacer()
            HStack {
                Button("Update"){
                        updateOrder()
                        if newOrder{
                            orders.addOrder(orderItem: orderItem)
                        } else {
                            orders.replaceOrder(id: orderItem.id, with: orderItem)
                        }
                        presentSheet = false
                        presentAlert = true
                    }
                    .padding()
                    .padding([.leading,.trailing])
                    .foregroundColor(.white)
                    .background(.green,in: Capsule())
                    .font(.title)
                    .padding(.trailing,20)
                    .shadow(radius:7,x:2,y:2)
                    .alert("Hulio Pizza Copany \n \(orderItem.name) Updated ",isPresented: $presentAlert){
                        
                    }
//                Button("Cancel"){
//                    presentSheet = false
//                }
//                .padding()
//                .padding([.leading,.trailing])
//                .foregroundColor(.white)
//                .background(.red,in: Capsule())
//                .font(.title)
//                .shadow(radius:7,x:2,y:2)
            }
        }
        .padding()
        .navigationTitle("Your Order")
        .background(Color("Surf"),in:Rectangle())
        
    }
    
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(orderItem:  .constant(testOrderItem), presentSheet: .constant(true), newOrder: .constant(false)).environmentObject(OrderModel())
    }
}

let noOrderItem = OrderItem(id: -1, item:noMenuItem)

extension OrderModel{
    func replaceOrder(id:Int,with item:OrderItem){
        if let index = self.orderItems.firstIndex(where: {$0.id == id}){
            self.orderItems.remove(at: index)
            self.orderItems.insert(item, at: index)
        }
    }
}
