//
//  request.swift
//  My First App
//
//  Created by Olivier CHAAR on 9/25/19.
//  Copyright © 2019 Olivier CHAAR. All rights reserved.
//

/* This my code to call API Food2fork but I can't access to the api response.
 I tried to print without success.
 So I decided to create the app without the api, I let you the code here, if you find my mystake,
 I'll be glad to know it.*/

import Foundation

struct DataRecipe: Decodable {
    var publisher: String
    var recipe_id: String
    var image_url: String
    var rank: Int
    var title: String
    var ingredient: IngredientsInfo
}

struct IngredientsInfo: Decodable {
    var ingredients: String
}


let apikey = "e233392b5ff8ef7d93a27fa6c753a682"

func APIrequest() {
    
    let headers = [
        "x-rapidapi-host": "community-food2fork.p.rapidapi.com",
        "x-rapidapi-key": "9be2113defmshae431d5288d66a1p11176cjsn32452c3bd6bc"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://community-food2fork.p.rapidapi.com/get?rId=37859&key=\(apikey)")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 1.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) {data, response, error in
        if (error != nil) {
            print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
        }
        if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
            print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
            print("réponse = \(response)") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
        }
        
        let responseAPI = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        print("responseString = \(responseAPI)") // Affiche dans la console la réponse de l'API
        guard
            let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
            let json = jsonObject as? [String: Any]
            else {
                print("Could not parse JSON")
                return
        }
        
        if let status = json["status"] as? String {
            print(status)
        }
    }
    dataTask.resume()
}

let test = APIrequest()
let decoder = JSONDecoder()
//let container = try decoder.container(keyedBy: DataRecipe.self)

