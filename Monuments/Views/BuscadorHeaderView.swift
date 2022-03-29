//
//  BuscadorHeaderView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 27/3/22.
//

import SwiftUI

struct BuscadorHeaderView: View {
    
    @ObservedObject var viewModel: HomeScreenViewModel
    @Binding var showModal: Bool
    
    @State var titleText: String = ""
    @State var estiloText: String = ""
    @State var distanceText: String = ""
    @State var resultNumberText: String = ""
    
    var body: some View {
        VStack (spacing: 20) {
            
            componentCloseButtonComponent
            
            componentTitleAndTextField
            
            componentStyleAndTextField
            
            componentResultNumberAndTextField
            
            HStack {
                componentButtonSearch
                componentResetButton
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

extension BuscadorHeaderView {
    
    private var componentCloseButtonComponent: some View {
        HStack {
            Spacer()
            Button {
                self.showModal = false
            } label: {
                Image(systemName: "x.square.fill")
                    .foregroundColor(Color.black)
            }

        }
    }
    
    private var componentTitleAndTextField: some View {
        HStack (spacing: 5){
            Text("Title:")
            TextField("Museo del Foro de Caesaraugusta", text: $titleText)
        }
    }
    
    private var componentStyleAndTextField: some View {
        HStack (spacing: 5){
            Text("Style:")
            TextField("Romano", text: $estiloText)
        }
    }
    
    private var componentResultNumberAndTextField: some View {
        HStack (spacing: 5){
            Text("Results Number:")
            TextField("50", text: $resultNumberText)
        }
    }
    
    private var componentButtonSearch: some View {
        Button {
            viewModel.getAllTheMonuments(title: titleText, estilo: estiloText.lowercased(), datacion: "", distance: 50, numeroResultados: Int(resultNumberText) ?? 500)
            
            showModal = false
        } label: {
            HStack (spacing: 5){
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
        }

    }
    
    private var componentResetButton: some View {
        Button {
            viewModel.getAllTheMonuments(title: "", estilo: "", datacion: "", distance: 50, numeroResultados: 500)
            
            showModal = false
        } label: {
            Text("Reset")
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundColor(Color.white)
                .clipShape(Capsule())
        }

    }
}

struct BuscadorHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BuscadorHeaderView(viewModel: HomeScreenViewModel(), showModal: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
