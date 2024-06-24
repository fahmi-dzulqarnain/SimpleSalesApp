//
//  ProductDetailView.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 22/06/2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var header: HeaderType
    var selectedProduct: Product?
    
    @Binding var isAddingProduct: Bool
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        
        ScrollView {
            
            VStack(
                alignment: .leading,
                spacing: 24
            ) {
                Text("Product Name")
                    .font(.subheadline)
                
                TextField(
                    "Product Name",
                    text: $viewModel.productName
                )
                .textFieldStyle(.roundedBorder)
                
                Text("Price")
                    .font(.subheadline)
                
                TextField(
                    "Price",
                    text: $viewModel.price
                )
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .onChange(of: viewModel.price) { newValue in
                    viewModel.price = newValue.withThousandSeparator
                }
                
                HStack {
                    Text("Product Type")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Picker(
                        selection: $viewModel.type,
                        label: Text("Product Type")
                    ) {
                        ForEach(
                            ProductType.allCases,
                            id: \.self
                        ) { type in
                            Text(type.rawValue)
                                .tag(type.rawValue)
                        }
                    }
                }
                
                Button(action: {
                    viewModel.saveProduct(
                        header,
                        selectedProduct
                    )
                    
                    isAddingProduct.toggle()
                }, label: {
                    Text("Save Product")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .padding(.top, 32)
                .disabled(viewModel.isCantAdd)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
        }
        .navigationTitle(header.rawValue)
        .onAppear {
            if let selectedProduct {
                viewModel.updateProduct(product: selectedProduct)
            }
        }
    }
}

#Preview {
    ProductDetailView(
        header: .add,
        isAddingProduct: .constant(true)
    )
}
