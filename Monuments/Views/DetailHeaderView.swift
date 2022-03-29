//
//  DetailHeaderView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 29/3/22.
//

import SwiftUI

struct DetailHeaderView: View {
    
    var monumentTitle: String
    var monumentImage: String
    
    var body: some View {
        HStack {
            
            componentPersonTextInformation
            
            Spacer()
            
            componentPersonImageInformation
        }
        .padding()
    }
}

extension DetailHeaderView {
    
    private var componentPersonTextInformation: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(monumentTitle)
                .font(.largeTitle)
                .fontWeight(.black)
            
        }
        .foregroundColor(.black)
    }
    
    private var componentPersonImageInformation: some View {
        
        ZStack {
            let url = URL(string: monumentImage)
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}


struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(monumentTitle: "Monument Name", monumentImage: "")
            .previewLayout(.sizeThatFits)
    }
}
