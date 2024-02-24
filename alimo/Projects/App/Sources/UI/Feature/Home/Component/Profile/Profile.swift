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
    @State var newpost: Bool
    var title : String 
    var membername : String
    
    init(newpost: Bool = false, title: String = "", membername : String = "") {
        self.newpost = newpost
        self.title = title
        self.membername = membername
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .foregroundStyle(Color.black)
                    .font(.label)
                    .overlay {
                        if newpost {
                            HStack {
                                Spacer()
                                AlimoBadge()
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }
                Text(membername)
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

