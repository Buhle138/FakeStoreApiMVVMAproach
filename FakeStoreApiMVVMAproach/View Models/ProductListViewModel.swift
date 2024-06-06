//
//  ProductListViewModel.swift
//  FakeStoreApiMVVMAproach
//
//  Created by Buhle Radzilani on 2024/06/06.
//

import Foundation


//This ensures we run this code on the main thread.
@MainActor
class ProductListViewModel: ObservableObject {
    
    //When the value of @Published property changes, any swifui views observing the ObservableObject will be notifiee and will automatically re-render to reflect the new data.
    
    @Published var products: [ProductViewModel] = []
    
    let webservice: Webservice
    
    init(webservice: Webservice){
        self.webservice = webservice
    }
    
    func populateProducts() async {
        
        do {
           let products =  try await  webservice.getProducts()
//The reason we map is because the right hand side is an array of product and the other one is an array of ProductViewModel.
//so with the map we are passing all the Products from webservice into the products view model
            self.products = products.map(ProductViewModel.init)
        }catch{
            print(error)
        }
       
    }
}

//In order to display something on the screen using the MVVM approach we will need to change this product into something suitable for the screen. So lets create product view model below

struct ProductViewModel {
    
   private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String{
        product.title
    }
    
    var price: Double {
        product.price
    }
    
}


