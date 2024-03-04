//
//  Downloadbutton.swift
//  App
//
//  Created by dgsw8th61 on 1/18/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct FileCeil: View {
    
    var file: ImageOrFile
    
    var body: some View {
        
        var fileSize = Double(file.fileSize) / 1024.0 / 1024.0
        
        HStack(spacing: 0) {
            Image("File")
                .resizable()
                .frame(width: 28, height: 28)
            VStack(alignment: .leading, spacing: 0) {
                Text(file.fileName)
                    .font(.label)
                HStack {
                    Text("\(fileSize) MB")
                        .font(.cute)
                    Spacer()
                }
            }
            .padding(.leading, 12)
            Spacer()
            Button {
                
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
