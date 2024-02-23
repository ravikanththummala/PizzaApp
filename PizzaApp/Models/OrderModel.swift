//
//  OrderModel.swift
//  HuliPizza
//
//  Created by Steven Lipton on 10/14/22.
//

import Foundation

enum OrderType:String,CaseIterable{
    case takeout = "Takeout"
    case dineIn = "Dining In"
    case delivery = "Delivery"
}
/// The Model to hold our orders.
class OrderModel: ObservableObject{
    @Published var orderItems:[OrderItem] = []
    var customerName = "Customer Name"
    var orderType:OrderType = .takeout
    private var lastID:Int = 0
    ///Use only for testing purposes
    init(){
        // Testing Code: comment out for production
        orderItems.append(OrderItem(id:0,item: testMenuItem))
        orderItems.append(OrderItem(id:1,item: MenuModel().menu[3],quantity: 2))
        lastID = 1
        //testing code end
        
    }
    ///Computes the count of order items
    var orderCount:Int{
        orderItems.count
    }
    ///Computes the grand total of the orders.
    var orderTotal:Double{
        var total:Double = 0.0
        for item in orderItems{
            total += item.extPrice
        }
        return total
    }
    ///Adds an Order with a menu item and quantity
    func addOrder(_ item:MenuItem, quantity:Int){
        lastID += 1
        let newOrder = OrderItem(id: (lastID) , item:item, quantity:quantity)
        orderItems.append(newOrder)
    }
    /// Adds an Order from a OrderItem
    func addOrder(orderItem:OrderItem){
        var  newOrder = orderItem
        lastID += 1
        newOrder.id = lastID
        orderItems.append(newOrder)
    }
    
    /// Removes an Order
    func removeOrder(id:Int){
        if let index = orderItems.firstIndex(where: {$0.id == id}){
            orderItems.remove(at: index)
        }
    }
    /// Removes the last Order
    func removeLast(){
        orderItems.removeLast()
    }
}



