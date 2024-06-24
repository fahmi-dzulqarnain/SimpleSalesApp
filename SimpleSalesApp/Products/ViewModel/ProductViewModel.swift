//
//  ProductViewModel.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 23/06/2024.
//

import Foundation

class ProductViewModel: ObservableObject, RealmInstance {
    @Published var productName: String = ""
    @Published var price: String = ""
    @Published var type: ProductType = .buah
    
    var isCantAdd: Bool {
        productName.isEmpty &&
        price.isEmpty
    }
    
    func saveProduct(
        _ header: HeaderType,
        _ selectedProduct: Product?
    ) {
        if header == .detail, 
           let selectedProduct {
            
            let existingProduct = realm
                .objects(Product.self)
                .first { product in
                    product.id == selectedProduct.id
                }
            
            writeToRealm {
                existingProduct?.name = productName
                existingProduct?.price = Int(price.withoutSeparator) ?? 0
                existingProduct?.type = type.rawValue
            }
            
        } else {
            let product = Product()
            product.name = productName
            product.price = Int(price.withoutSeparator) ?? 0
            product.type = type.rawValue
            
            writeToRealm {
                realm.add(product)
                resetForm()
            }
        }
    }
    
    func updateProduct(product: Product) {
        productName = product.name
        price = "\(product.price)".withThousandSeparator
        type = ProductType(rawValue: product.type) ?? .buah
    }
    
    private func resetForm() {
        productName = ""
        price = ""
    }
}

enum HeaderType: String {
    case add = "Add Product"
    case detail = "Product Detail"
}
