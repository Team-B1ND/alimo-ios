//
//  PreviewImageView.swift
//  App
//
//  Created by dgsw8th61 on 5/4/24.
//  Copyright © 2024 b1nd. All rights reserved.
//

import Foundation
import SwiftUI

struct PreviewImageView: View {
    var imageUrls: [String]
    var name : String
    var Info : String
    var onClickDownload : () -> Void
    @State private var currentIndex = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TabView(selection: $currentIndex) {
                ForEach(imageUrls.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: imageUrls[index])) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .offset(y: -20)
                                .overlay{
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Image("Image")
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                            VStack(spacing:5){
                                                Text(name)
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .padding(.trailing,140)
                                                Text(Info)
                                                    .foregroundColor(.white)
                                            }
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        
                                    }
                                }
                        case .failure(_):
                            Image(systemName: "photo")
                                .font(.title)
                                .foregroundColor(.gray)
                        case .empty:
                            ProgressView()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                HStack(alignment: .center, spacing: 16) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }
                
                Text("\(currentIndex + 1)/\(imageUrls.count)")
                    .foregroundColor(.white)
                    .font(.headline)
                
                
                Button {
                    onClickDownload()
                } label: {
                    Image("Download")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .offset(x:240)
                        
                }
            }
                .padding(.horizontal)
                                
            )
        }
    }
}
