//
//  Profile.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileCeil: View {
    @State var isNew: Bool
    var title: String
    var membername: String
    
    init(isNew: Bool = false, title: String = "", membername : String = "") {
        self.isNew = isNew
        self.title = title
        self.membername = membername
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundStyle(Color.black)
                .multilineTextAlignment(.leading)
                .font(.bodyLight)
                .overlay {
                    if isNew {
                        HStack {
                            Spacer()
                            AlimoBadge()
                                .offset(x: 12, y: -10)
                        }
                    }
                }
            Text(membername)
                .foregroundStyle(Color.gray600)
                .font(.label)
        }
        .toLeading()
    }
}
