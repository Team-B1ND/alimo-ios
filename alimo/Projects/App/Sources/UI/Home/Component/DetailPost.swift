//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailPost: View {
    var body: some View {
        VStack(alignment: .leading) {
            Profile()
                .padding(.horizontal,35)
            VStack{
                DetailContents()
            }
            .padding(.horizontal,35)
            HStack{
                Spacer()
                Postimage()
                Spacer()
            }
            
            HStack {
                Spacer()
                Emoji()
                Spacer()
            }
            
            Divider()
        }

        
    }
}



#Preview {
    DetailPost()
}
