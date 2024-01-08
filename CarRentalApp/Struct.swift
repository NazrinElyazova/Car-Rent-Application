//
//  Struct.swift
//  CarRentalApp
//
//  Created by Nazrin on 21.10.23.
//

import Foundation
enum carCategory {
    case standart
    case prestige
    case suv
    case ekonom
}

struct car {
    var price: String
    var name: String
    var engine: String
    var carImage: String
    var categories: carCategory
}

//
//var avto = [car(price: "350 Azn", name: "Tayota", engine: "6 litres", carImage:
//           "car_1",  categories: .prestige),
//            car(price: "200 Azn", name: "Bentley", engine: "20 litres", carImage: "car_2", categories: .suv),
//            car(price: "1000 Azn", name: "Lexus", engine: "17 litres", carImage: "car_3", categories: .ekonom)]
//
                
            
