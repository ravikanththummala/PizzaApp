//
//  RatingView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/21/24.
//

import SwiftUI

struct RatingView: View {
    
    var rating:Int
    var body: some View {
        HStack {
            ForEach(1...6,id: \.self){ circle in
                Image(systemName: (circle <= rating) ?  "fork.knife.circle.fill" : "circle")
                    .font(.largeTitle)
            }
        }
    
    }
}

#Preview {
    RatingView(rating: 3)
}
