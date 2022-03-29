//
//  GoogleMapsDetailView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 29/3/22.
//

import SwiftUI
import GoogleMaps
import GoogleMapsUtils

struct GoogleMapsDetailView: UIViewRepresentable {
    
    var coordenateX: Double = 0.0
    var coordenateY: Double = 0.0
    
    func makeUIView(context: Self.Context) -> GMSMapView {

        let camera = GMSCameraPosition.camera(withLatitude: coordenateX, longitude: coordenateY, zoom: 17.8)
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        return mapView

    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        let position = CLLocationCoordinate2D(latitude: coordenateX, longitude: coordenateY)
        let marker = GMSMarker(position: position)
        marker.map = mapView
    }
    
}

struct GoogleMapsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsDetailView(coordenateX: 0.0, coordenateY: 0.0)
    }
}
