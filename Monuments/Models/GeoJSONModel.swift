//
//  GeoJSONModel.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 22/3/22.
//

import Foundation

struct GeoJSONModel: Codable {
    var type: String
    var features: [GeoJSONModelFeatures]
}

struct GeoJSONModelFeatures: Codable {
    var type: String
    var properties: FeatureProperties?
    var geometry: Feature
}

// MARK: - FeatureProperties
struct FeatureProperties: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String?
    var propertiesDescription: String?
    var estilo: String?
    var address: String?
    var datacion: String?
    var datos: String?
    var image: String?
    var foursquare:String?
    var lastUpdated: String?
    var links: [Link]?
    var uri: String?
    var sameAs: String?
}

// MARK: - Link
struct Link: Codable {
    let linkDescription: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case linkDescription
        case url
    }
}

// MARK: - Feature
struct Feature: Codable {
    var type: String?
    var coordinates: [Double]
}
