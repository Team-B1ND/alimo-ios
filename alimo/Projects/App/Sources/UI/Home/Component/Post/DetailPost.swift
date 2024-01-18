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
//    @State private var isButtonPressed : Bool = false
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
//            HStack{
//                Spacer()
//                Button {
//                    isButtonPressed.toggle()
//                } label: {
//                    if isButtonPressed {
//                        Image("VectorYellow")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 13, height: 13)
//                    } else {
//                        Image("VectorWhite")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 13, height: 13)
//                    }
//                }
//                .padding(.trailing,50)
//            }
            HStack {
                Spacer()
                Emoji()
                Spacer()
            }
            .padding(5)
            
            Divider()
        }

        
    }
}



#Preview {
    DetailPost()
}
