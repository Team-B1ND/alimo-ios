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
    
    enum FileVolume {
        case byte
        case kb
        case mb
        case gb
        case tb
        var text: String {
            switch self {
            case .byte:
                "Byte"
            case .kb:
                "KB"
            case .mb:
                "MB"
            case .gb:
                "GB"
            case .tb:
                "TB"
            }
        }
    }
    
    var file: ImageOrFile
    var onClickDownload: () -> Void
    
    var body: some View {
        
        let fileSize = generateTextBasedOnFileSize(fileSizeInBytes: Double(file.fileSize))
        
        HStack(spacing: 0) {
            Image(.file)
                .resizable()
                .frame(width: 28, height: 28)
            VStack(alignment: .leading, spacing: 0) {
                Text(file.fileName)
                    .font(.label)
                    .foregroundColor(.black)
                HStack {
                    Text("\(String(format: "%0.2f", fileSize.0)) \(fileSize.1.text)")
                        .font(.cute)
                        .foregroundColor(.black)
                    Spacer()
                }
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
    
    func generateTextBasedOnFileSize(fileSizeInBytes: Double) -> (Double, FileVolume) {
        let fileSizeKB = fileSizeInBytes / 1024.0
        let fileSizeMB = fileSizeKB / 1024.0
        let fileSizeGB = fileSizeMB / 1024.0
        let fileSizeTB = fileSizeGB / 1024.0
        
        if fileSizeTB >= 1 {
            return (fileSizeTB, .tb)
        } else if fileSizeGB >= 1 {
            return (fileSizeGB, .gb)
        } else if fileSizeMB >= 1 {
            return (fileSizeMB, .mb)
        } else if fileSizeKB >= 1 {
            return (fileSizeKB, .kb)
        } else {
            return (fileSizeInBytes, .byte)
        }
    }
}
