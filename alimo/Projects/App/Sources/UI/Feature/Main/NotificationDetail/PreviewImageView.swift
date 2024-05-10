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
    enum Dialog {
        case file
        case image
    }
    var imageUrls: [String]
    var name : String
    var Info : String
    var onClickDownload : () -> Void
    @State var showDialog = false
    @State var dialog = Dialog.file
    @State private var currentIndex = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Image(.image)
                        .resizable()
                        .frame(width: 28, height: 28)
                    VStack(spacing:5){
                        Text(name)
                            .foregroundColor(.white)
                            .bold()
                            .font(.bodyLight)
                            .toLeading()
                        Text(Info)
                            .font(.caption)
                            .foregroundColor(.white)
                            .toLeading()
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
            }
            TabView(selection: $currentIndex) {
                ForEach(imageUrls.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: imageUrls[index])) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .offset(y: -20)
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
            .alimoToolbar("", imageColor: .white) {
                presentationMode.wrappedValue.dismiss()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(alignment: .center, spacing: 20) {
                        Text("\(currentIndex + 1)/\(imageUrls.count)")
                            .foregroundColor(.white)
                            .font(.bodyLight)
                        
                        Button {
                            onClickDownload()
                            showDialog = true
                        } label: {
                            Image("Download")
                                .resizable()
                                .frame(width: 24, height: 24)
                               
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }

        }
        .alert(isPresented: $showDialog) {
            switch dialog {
            case .file:
                Alert(title: Text("파일 다운로드 성공"),
                      dismissButton: .default(Text("닫기")))
            case .image:
                Alert(title: Text("이미지 다운로드 성공"),
                      dismissButton: .default(Text("닫기")))
            }
        }
    }
}
