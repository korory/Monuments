//
//  HomeScreenView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 19/3/22.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject var viewModel = HomeScreenViewModel()
    @State var isSearchButtonPressed: Bool = false
    @State var showDetailView: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                addGoogleMapsComponent
            }
            
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        componentButtonSearch
                    }
                }
            }
            
            if isSearchButtonPressed {
                VStack (alignment: .center){
                    GeometryReader{_ in
                        BuscadorHeaderView(viewModel: viewModel, showModal: $isSearchButtonPressed)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.65))
            }
        }
    }
}

extension HomeScreenView {
    
    private var addGoogleMapsComponent: some View {
        ZStack {
            GoogleMapsView(viewModel: viewModel, showDetailView: $showDetailView)
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            viewModel.getAllTheMonuments(title: "", estilo: "", datacion: "", distance: 500, numeroResultados: 500)
        }
        .sheet(isPresented: $showDetailView) {
            DetailScreenView(monumentsModel: viewModel.monumentsModelDetail)
        }
    }
    
    private var componentButtonSearch: some View {
        Button {
            isSearchButtonPressed = true
        } label: {
            Image(systemName: "magnifyingglass.circle.fill")
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                .padding()
        }

    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
