//
//  ContentView.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 22/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            Text("Summary")
                .tabItem {
                    Label(
                        "Summary",
                        systemImage: "chart.pie.fill"
                    )
                }
            
            Text("Sales")
                .tabItem {
                    Label(
                        "Sales",
                        systemImage: "cart.fill"
                    )
                }
            
            ProductsView()
                .tabItem {
                    Label(
                        "Products",
                        systemImage: "shippingbox.fill"
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}

enum ProductType: String, CaseIterable {
    case buah = "Buah"
    case sayur = "Sayur"
}
