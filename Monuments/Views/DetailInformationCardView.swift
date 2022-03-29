//
//  DetailInformationCardView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 29/3/22.
//

import SwiftUI

struct DetailInformationCardView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)

                Spacer()
            }
            .foregroundColor(.gray)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            HStack {
                Image(systemName: "dot.square")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(description)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct DetailInformationCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInformationCardView(title: "Test", description: "Test")
    }
}
