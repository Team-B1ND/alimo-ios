//
//  Downloadbutton.swift
//  App
//
//  Created by dgsw8th61 on 1/18/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Downloadbutton : View {
    var body: some View {
        
            
       
            ZStack{
                Rectangle()
                    .frame(width: 300,height: 45)
                    .cornerRadius(3)
                    .foregroundColor(.gray100)
                    .overlay{
                        HStack{
                            Image("Image")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 35)
                                .clipShape(Circle())
                                .padding()
                            
                            Spacer()
                            
                            VStack(alignment : .leading){
                                Text("B1nd인턴+여행계획서.pptx")
                                    .font(.label)
                                HStack{
                                    Text("191.3 KB")
                                        .font(.cute)
                                        
                                    Spacer()
                                }
                                
                            }
                            
                            Spacer()
                            
                            Button {
                                //
                            } label: {
                                Image("Download")
                                    .resizable()
                                    .frame(width: 10,height: 16)
                                    .padding()
                            }

                        }

                    }
            }
        

    }
}

#Preview {
    Downloadbutton()
}
