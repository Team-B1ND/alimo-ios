//
//  Profile.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Profile: View {
    
    @State var Newpost: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("수상한 사람 문화상품권 받으러 오세요")
                    .foregroundStyle(Color.black)
                    .font(.label)
                    .overlay {
                        if Newpost {
                            HStack {
                                Spacer()
                                AlimoBadge()
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }
                Text("빈윤미")
                    .foregroundStyle(Color.gray600)
                    .font(.caption)
            }
            Spacer()
            Button {
                
            } label: {
                Image(AppAsset.Assets.roundbutton.name)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

#Preview {
    Profile()
}

