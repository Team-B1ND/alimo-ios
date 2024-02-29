//
//  AlimoWebView.swift
//  App
//
//  Created by dgsw8th71 on 2/29/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import WebKit

struct AlimoWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
