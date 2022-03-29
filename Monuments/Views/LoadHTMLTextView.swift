//
//  LoadHTMLTextView.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 29/3/22.
//

import SwiftUI
import WebKit

struct LoadHTMLTextView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}

struct LoadHTMLTextView_Previews: PreviewProvider {
    static var previews: some View {
        LoadHTMLTextView(htmlContent: "")
    }
}
