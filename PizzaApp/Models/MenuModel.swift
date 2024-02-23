//
//  MenuModel.swift
//  menuModelPlay
//
//  Created by Steven Lipton on 9/14/22.
//

import Foundation

/// An example of a static model that trickles down data through a view hierarchy, but does not change.
class MenuModel{
    
    struct Menu:Codable{
        var menu:[MenuItem]
    }
    
    var menu:[MenuItem] = []
    
    init(){
        if let menuJSON = decodeJSON(data: data){
            menu = menuJSON.menu
        }
    }
    
    func decodeJSON(data:Data!)-> Menu! {
        var menu:Menu! = nil
        let decoder = JSONDecoder()
        do{
            try menu = decoder.decode(Menu.self, from: data)
        } catch let error as NSError{
        print("Error reading JSON file: \(error.localizedDescription)")
        }
        return menu
    }
}

/// Basic JSON data ready to use in the MenuModel. Usually this would come in an external file, but for instructional purposes I put it here.
let data = """
    {"menu":[
       {
          "id":0,
          "category":"Italian Specialty pizzas",
          "name":"Margherita",
          "description":"The classic pizza of Buffalo. Mozzarella, tomatoes, and basil on a Neopolitan crust",
          "crust":"Neopolitan",
          "price":12.99,
          "rating":5
       },
    {
          "id":1,
          "category":"Italian Specialty pizzas",
          "name": "Quattro Formaggi",
           "description": "A blend of Asiago, Parmesan, buffalo mozzarella, and Gorgonzola on a Neopolitan crust",
          "crust": "Neopolitan",
          "price":15.00,
          "rating":6
       },
    {
          "id":2,
          "category": "Mainland Specialty Pizzas",
            "name": "The Big Island ",
            "description": "A meaty calzone exploding like a volcano. Sausage combined with vegetables, pineapple, and a special lava sauce leaking out the top crater. Definitely share this one.",
            "crust": "Calzone",
          "price":18.00,
          "rating":4
       },
    {
          "id":3,
          "category": "Mainland Specialty Pizzas",
            "name": "Longboard",
            "description": " A very long flatbread for vegetarians and vegans, made with olive oil, mushrooms, garlic, fresh ginger, and macadamias, sweetened with lilikoi.",
            "crust": "New York",
          "price":11.00,
          "rating":5
       },
    {
          "id":4,
          "category": "Mainland Specialty Pizzas",
            "name": "Pepperoni",
            "description": " The New York classic version. A thin crust with pizza sauce, cheese, and pepperoni.",
            "crust": "New York",
          "price":12.00,
          "rating":5
       },
    {
          "id":5,
          "category": "Mainland Specialty Pizzas",
            "name": "Chicago Deep Dish",
            "description": "Chicago Deep Dish: The classic deep dish cheese pizza. 2 inches Thick and filled with sauce and cheese. ",
            "crust": "Deep Dish",
          "price":16.00,
          "rating":4
       },
    {
          "id":6,
          "category": "Mainland Specialty Pizzas",
            "name": "Meat Lovers",
            "description": "A deep dish for the carnivore. Sausage and pepperoni in the classic Chicago deep dish.",
            "crust": "Deep Dish",
          "price":18.00,
          "rating":4
       },
    {
          "id":7,
          "category": "Mainland Specialty Pizzas",
            "name": "BBQ Chicken",
            "description": "BBQ Chicken: Grilled chicken with barbecue sauce, red onions, and peppers on a Neopolitan crust",
            "crust": "Neopolitan",
          "price":15.00,
          "rating":6
       },{
          "id":8,
          "category": "Huli Pizza Originals",
            "name": "Huli Chicken",
            "description": "Huli Chicken: Our original Hawaiian street food pizza, with Huli Huli chicken, onions, ginger, crushed macadamia nuts, tomato sauce, and cheese on a classic crust.",
            "crust": "Neopolitan",
          "price":15.00,
          "rating":6
       },
    {
          "id":9,
          "category": "Huli Pizza Originals",
            "name": "Hawaiian",
            "description": "It may be from the mainland, but we make it our own. Pineapple, SPAM, cheese, onions, bean sprouts, and tomato sauce on a thin crust.",
            "crust": "New York",
          "price":13.00,
          "rating":4
       },
    {
          "id":10,
          "category": "Huli Pizza Originals",
            "name": "Spam Musubi",
            "description": "Spam, Furikake, Nori on a bed of Sushi rice",
            "crust": "Musubi",
          "price":13.00,
          "rating":3
       },
    {
          "id":11,
          "category": "Huli Pizza Originals",
            "name": "Veggie Musubi",
            "description": "Coffee-Smoked Tofu, Pineapple,  Ube, and Nori on a bed of Sushi rice",
            "crust": "Musubi",
          "price":14.00,
          "rating":4
       }
    ]
    }
    """.data(using: .utf8)

