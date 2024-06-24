//
//  ProductsView.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 23/06/2024.
//

import RealmSwift
import SwiftUI

struct ProductsView: View {
    
    @ObservedResults(Product.self) var products
    @State var isAddingProduct = false
    @State var isProductDetail = false
    @State var selectedProduct: Product?
    
    var body: some View {
        
        NavigationView {
            List(products, id: \.name) { product in
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.headline)
                    
                    Text(product.type)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .onTapGesture {
                    selectedProduct = product
                    isProductDetail.toggle()
                }
            }
            .background {
                NavigationLink(
                    destination: ProductDetailView(
                        header: .detail,
                        selectedProduct: selectedProduct,
                        isAddingProduct: $isProductDetail
                    ),
                    isActive: $isProductDetail
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: ProductDetailView(
                            header: .add,
                            isAddingProduct: $isAddingProduct
                        ),
                        isActive: $isAddingProduct
                    ) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ProductsView()
}
