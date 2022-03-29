//
//  HomeScreenViewModel.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 19/3/22.
//

import Foundation
import Combine
import Alamofire
import GoogleMaps
import GoogleMapsUtils

class HomeScreenViewModel: ObservableObject {
    
    @Published var monumentsModel: MonumentsModel?
    @Published var monumentsModelDetail: ResultModel?
    
    func getAllTheMonuments(title: String, estilo: String, datacion: String, distance: Int, numeroResultados: Int) {
        
        let headers: HTTPHeaders = [
          "Accept": "application/json"
        ]
        
        let params: Parameters = [
            "rf" : "html",
            "srsname" : "wgs84",
            "start" : 0,
            "rows" : numeroResultados,
            "distance": distance,
            "locale" : "es",
            "title" : title,
            "estilo": estilo,
            "datacion" : datacion
        ]
        
        guard let url = URL(string: ApiService.Endpoints.allMonuments) else { return }
        
        makeURLCall(url: url, params: params, headers: headers)
    }
    
    func makeURLCall(url: URL, params: Parameters?, headers:HTTPHeaders?) {
        
        AF.request(url, method: .get, parameters: params, headers: headers).validate().responseDecodable(of: MonumentsModel.self) { response in
        
            do {
                guard let dataSecure = response.data else { return }
                self.monumentsModel = try JSONDecoder().decode(MonumentsModel.self, from: dataSecure)
                self.createGEOJSONDocument()
                
            }catch {
                print(error)
            }
        }
    }
    
    func createGEOJSONDocument() {
        guard let monuments = self.monumentsModel?.result else { return }
        
        var allFeatures: [GeoJSONModelFeatures] = []

        for coordenates in monuments {
            
            guard let geometry = coordenates.geometry else { continue }
            
            let features = GeoJSONModelFeatures(type: "Feature", properties: FeatureProperties(id: coordenates.id, title: coordenates.title, propertiesDescription: "", estilo: "", address: coordenates.address, datacion: coordenates.datacion, datos: "", image: coordenates.image, foursquare: coordenates.foursquare, lastUpdated: coordenates.lastUpdated, links: [Link(linkDescription: "", url: "")], uri: coordenates.uri, sameAs: coordenates.sameAs), geometry: geometry)
            
            allFeatures.append(features)
        }
        
        let geoJSONCreator = GeoJSONModel(type: "FeatureCollection", features: allFeatures)
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(geoJSONCreator)
            let geoJSONParser = GMUGeoJSONParser(data: jsonData)
            geoJSONParser.parse()
            geoCoordenates = geoJSONParser.features
        }
        catch {
        }
    }
}

