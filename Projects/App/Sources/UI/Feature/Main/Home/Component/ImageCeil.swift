//
//  ImageCeil.swift
//  App
//
//  Created by dgsw8th71 on 3/4/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ImageCeil: View {
    
    var images: [ImageOrFile]
    var info : String
    var name : String
    var onClickDownload: () -> Void
    
    var body: some View {
        NavigationLink {
            PreviewImageView( imageUrls: images.map { $0.fileUrl }, name: name, Info: info,onClickDownload:onClickDownload)
        } label: {
            HStack(spacing: 0) {
                Image(.image)
                    .resizable()
                    .frame(width: 28, height: 28)
                VStack(alignment: .leading, spacing: 0) {
                    Text("총 \(images.count)개 파일")
                        .foregroundStyle(Color.main500)
                        .font(.caption)
                    Text(images[0].fileName)
                        .font(.label)
                        .foregroundColor(.black)
                }
                .padding(.leading, 12)
                Spacer()
                Button {
                    onClickDownload()
                } label: {
                    Image(.download)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(12)
            .background(Color.gray100)
            .cornerRadius(8)
        }
    }
}
