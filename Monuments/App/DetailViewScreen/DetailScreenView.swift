//
//  DetailScreenView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 29/3/22.
//

import SwiftUI

struct DetailScreenView: View {
    
    var monumentsModel: ResultModel?
    
    var body: some View {
        VStack {
            DetailHeaderView(monumentTitle: monumentsModel?.title ?? "Monument Name", monumentImage: monumentsModel?.image ?? "")
            
            VStack {
                ScrollView {
                    
                    componentInformationCards
                    
                    componentWebView
                    
                    componentGoogleMaps
                    
                }
                .padding(.horizontal, 10)
            }
            Spacer()
        }
    }
}

extension DetailScreenView {
    
    private var componentInformationCards: some View {
        VStack {
            DetailInformationCardView(title: "Estilo", description: monumentsModel?.estilo ?? "No hay estilo disponible, disculpe las molestias")
            
            DetailInformationCardView(title: "Datación", description: monumentsModel?.datacion ?? "No hay datación disponible, disculpe las molestias")
            
            DetailInformationCardView(title: "Dirección", description: monumentsModel?.address ?? "No hay dirección disponible, disculpe las molestias")
            
            DetailInformationCardView(title: "Horario", description: monumentsModel?.horario ?? "No hay horario disponible, disculpe las molestias")
            
            DetailInformationCardView(title: "Teléfono", description: monumentsModel?.phone ?? "No hay teléfono disponible, disculpe las molestias")
        }
    }
    
    private var componentWebView: some View {
        VStack {
            HStack {
                Text("Visita")

                Spacer()
            }
            .foregroundColor(.gray)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            LoadHTMLTextView(htmlContent: monumentsModel?.visita ?? "No hay Información disponible, disculpe las molestias")
                .frame(height: 100, alignment: .center)
                .padding()
        }
    }
    
    private var componentGoogleMaps: some View {
        
        VStack {
            HStack {
                Text("Mapa")

                Spacer()
            }
            .foregroundColor(.gray)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            GoogleMapsDetailView(coordenateX: monumentsModel?.geometry?.coordinates[1] ?? 0.0, coordenateY: monumentsModel?.geometry?.coordinates[0] ?? 0.0)
                .frame(height: 250, alignment: .center)
                .padding(.horizontal, 10)
        }
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(monumentsModel: defaultResultModel)
    }
}
