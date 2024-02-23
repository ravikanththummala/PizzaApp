//
//  HeaderView.swift
//  PizzaApp
//
//  Created by Ravikanth  on 2/20/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders:OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass:UserInterfaceSizeClass?
    
    var body: some View {
        
        VStack {
            
            if(vSizeClass ?? .regular) != .compact {
                ZStack(alignment:.bottomTrailing) {
                    
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 28, relativeTo: .title))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                }
            } 
            else {
                HStack(alignment: .bottom){
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 28, relativeTo: .title))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("Surf"))
                        .fontWeight(.heavy)
                }
            }

        }
        .background(.ultraThinMaterial)
    }
}


#Preview {
    HeaderView()
        .environmentObject(OrderModel())
}
