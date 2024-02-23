//
//  OrderItem.swift
//  HuliPizza
//
//  Created by Steven Lipton on 10/21/22.
//

import Foundation

/// The basic unit of an order. Contains a menu item and user customization of that item.
struct OrderItem:Identifiable,Hashable{
    var id:Int
    var item:MenuItem
    // User customizations of the order
    var quantity:Int
    var extraIngredients:Bool = false
    var name:String = ""
    var preferredCrust:PizzaCrust
    var comments:String = ""
    
    init(id:Int,item:MenuItem, quantity:Int = 1){
        self.id = id
        self.item = item
        self.quantity = quantity
        self.preferredCrust = item.crust
    }
    
    init(id:Int,item:MenuItem, quantity:Int, extraIngredients:Bool, name:String, preferredCrust:PizzaCrust,comments:String){
        self.id = id
        self.item = item
        self.quantity = quantity
        self.preferredCrust = preferredCrust
        self.name = name
        self.comments = comments
    }
    ///Computes the extended price for an item
    var extPrice:Double{
        item.price * Double(quantity)
    }
    /// Custom hash function necessary for navigation paths to us `Hashable` protocol
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
    /// Custom equals function necessary for navigation paths to use `Equatable` protocol
//    static func ==(lhs:OrderItem, rhs:OrderItem)->Bool{
//        lhs.id == rhs.id &&
//        lhs.item == rhs.item &&
//        lhs.quantity == rhs.quantity &&
//        lhs.extraIngredients == rhs.extraIngredients &&
//        lhs.name == rhs.name &&
//        lhs.preferredCrust == rhs.preferredCrust &&
//        lhs.comments == rhs.comments
//
//    }
}

///test constant for an order item
let testOrderItem = OrderItem(id: 1,item: testMenuItem)

///test array of order items
let testOrders = [testOrderItem,OrderItem(id:2,item: MenuModel().menu[0], quantity: 2)]
