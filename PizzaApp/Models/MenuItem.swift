//
//  MenuItem.swift
//  
//
//  Created by Steven Lipton on 11/16/22.
//



import Foundation
/// Defines a menu item
struct MenuItem:Codable,Hashable,Identifiable{
    var id:Int
    var category:MenuCategory
    var name:String
    var description:String
    var crust:PizzaCrust
    var price:Double
    var rating:Int
    
    /// Custom hash method necessary for navigation paths to use `Hashable` protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    /// Custom equals method necessary for navigation paths to use `Equatable` protocol
    static func ==(lhs:MenuItem, rhs:MenuItem)->Bool{
        lhs.id == rhs.id &&
        lhs.category == rhs.category &&
        lhs.description == rhs.description &&
        lhs.crust == rhs.crust &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.rating == rhs.rating
        
    }
}

/// The categories of pizzas used
enum MenuCategory: String, Codable, CaseIterable {
    case originals = "Huli Pizza Originals"
    case italian = "Italian Specialty pizzas"
    case mainland = "Mainland Specialty Pizzas"
}

/// The basic types of pizza crust used.
enum PizzaCrust: String,Codable,CaseIterable {
    case neopolitan = "Neopolitan"
    case newYork = "New York"
    case calzone = "Calzone"
    case deepDish = "Deep Dish"
    case musubi = "Musubi"
}


/// A test MenuItem for previews while composing views
let testMenuItem = MenuItem(id: 0, category: .italian, name: "Huli Chicken Pizza", description: "The classic pizza that started it all", crust: .neopolitan, price: 14.99, rating: 5)

/// used when there is no Menu Item
let noMenuItem = MenuItem(id: -1, category: .italian, name: "World Pizza with Aloha", description: "We're a small growing chain based in Honolulu, serivng pizzas from around the world and with Hawaiian influence.", crust: .neopolitan, price: 0, rating: 0)
