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
    var onClickDownload: () -> Void
    
    var body: some View {
        
        HStack(spacing: 0) {
            Image("Image")
                .resizable()
                .frame(width: 28, height: 28)
            VStack(alignment: .leading, spacing: 0) {
                Text("총 \(images.count)개 파일")
                    .foregroundStyle(Color.main500)
                    .font(.caption)
                Text(images[0].fileName)
                    .font(.label)
            }
            .padding(.leading, 12)
            Spacer()
            Button {
                onClickDownload()
            } label: {
                Image("Download")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(12)
        .background(Color.gray100)
        .cornerRadius(8)
    }
}
