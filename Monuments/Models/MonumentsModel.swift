//
//  MonumentsModel.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 19/3/22.
//

import SwiftUI
import Foundation

// MARK: - MonumentsViewModel
struct MonumentsModel: Codable {
    let totalCount, start, rows: Int?
    let facetas: [Faceta]?
    let result: [ResultModel]?
}

// MARK: - Faceta
struct Faceta: Codable {
    let name, etiqueta: String
    let values: [Value]
}

// MARK: - Value
struct Value: Codable {
    let name: String
    let count: Int
}

// MARK: - Result
struct ResultModel: Codable, Identifiable {
    let id: UUID = UUID()
    let title, resultDescription, estilo, address: String?
    let horario, phone, datacion, uso: String?
    let price, visita: String?
    let image: String?
    let top: String?
    let foursquare: String?
    let lastUpdated: String?
    let geometry: Feature?
    let uri: String?
    let sameAs: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription
        case estilo, address, horario, phone, datacion, uso, price, visita, image, top, foursquare, lastUpdated, geometry, uri, sameAs
    }
}

// MARK: - Geometry
struct GeometryModel: Codable {
    let type: String
    let coordinates: [Double]
}


