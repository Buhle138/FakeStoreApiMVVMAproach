//
//  Webservice.swift
//  FakeStoreApiMVVMAproach
//
//  Created by Buhle Radzilani on 2024/06/06.
//

import Foundation

//If there is somthing wrong with the URL

enum NetworkError: Error{
    case badURL
    case badRequest
    case decodingError
}

//This web service wil be responsible for getting the data

class Webservice{
    
    func getProducts() async throws -> [Product]{
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else{
            throw NetworkError.badURL
        }
        
        //data and response are being returned by the URLSession
        //URLSession
        //This URLSession method gets the contents of a URL and returns the data and response.
        //Successful response is 200
        
      let (data, response) =  try await URLSession.shared.data(from: url)
       
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
           throw NetworkError.badRequest
        }
        
        //This variable below returns the products within an array.
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else{
            throw NetworkError.decodingError
        }
        
        return products
    }
    
}
