//
//  ApiService.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 19/3/22.
//

import SwiftUI

class ApiService {
    
    class Endpoints {
        static let baseURL = "https://www.zaragoza.es/sede"
        static let monuments = "/servicio/monumento"
        static let allMonuments = baseURL + monuments
        static let selectOneMonument = { (monumentId: String) in
            "\(allMonuments)/\(monumentId)"
        }
    }
}
