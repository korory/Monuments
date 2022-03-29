//
//  GoogleMapsView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 20/3/22.
//

import Foundation
import SwiftUI
import GoogleMaps
import GoogleMapsUtils

struct GoogleMapsView: UIViewRepresentable {
    
    @ObservedObject var viewModel: HomeScreenViewModel
    @Binding var showDetailView: Bool
    
    func makeUIView(context: Self.Context) -> GMSMapView {

        let camera = GMSCameraPosition.zaragoza
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(owner: self, viewModel: viewModel, showDetailView: $showDetailView)
    }
     
     func updateUIView(_ mapView: GMSMapView, context: Context) {
         mapView.clear()
         let renderer = GMUGeometryRenderer(map: mapView, geometries: geoCoordenates)
         renderer.render()
         
     }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        let owner: GoogleMapsView
        let viewModel: HomeScreenViewModel
        var showDetailView: Binding<Bool>

        init(owner: GoogleMapsView, viewModel: HomeScreenViewModel, showDetailView: Binding<Bool>) {
             self.owner = owner
                self.viewModel = viewModel
            self.showDetailView = showDetailView
           }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            
            let coordenateX = marker.layer.latitude
            let coordenateY = marker.layer.longitude
            
            guard let monumentResults = viewModel.monumentsModel?.result else { return false }

            for monumentModelResults in monumentResults {

                if monumentModelResults.geometry?.coordinates [0] == coordenateY &&
                    monumentModelResults.geometry?.coordinates [1] == coordenateX {
                    
                    viewModel.monumentsModelDetail = ResultModel(title: monumentModelResults.title, resultDescription: monumentModelResults.resultDescription, estilo: monumentModelResults.estilo, address: monumentModelResults.address, horario: monumentModelResults.horario, phone: monumentModelResults.phone, datacion: monumentModelResults.datacion, uso: monumentModelResults.uso, price: monumentModelResults.price, visita: monumentModelResults.visita, image: monumentModelResults.image, top: monumentModelResults.top, foursquare: monumentModelResults.foursquare, lastUpdated: monumentModelResults.lastUpdated, geometry: monumentModelResults.geometry, uri: monumentModelResults.uri, sameAs: monumentModelResults.sameAs)
                    
                    showDetailView.wrappedValue.toggle()

                }
            }
            return false
        }
    }
 }

extension GMSCameraPosition  {
    static var zaragoza = GMSCameraPosition.camera(withLatitude: 41.65001846652974, longitude: -0.888973268823382, zoom: 13.8)
 }
