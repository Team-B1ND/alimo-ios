//
//  DetailPostView.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

fileprivate let dummyComment = [
    (UUID(), "ㅎㅇ", []),
    (UUID(), "ㅎㅇㅎㅇ", [(UUID(), "ㅎㅇ1"),
                      (UUID(), "ㅎㅇ1\nasd\nsa"),
                      (UUID(), "ㅎㅇ2\n123\n213\n123"),
                      (UUID(), "ㅎㅇ1"),
                      (UUID(), "ㅎㅇ1\n123\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1"),
                      (UUID(), "He")
                     ])
]

struct DetailPostView : View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    DetailPost()
                    Divider()
                    Emoji()
                        .padding(.top, 16)
                    LazyVStack {
                        ForEach(dummyComment, id: \.0) { p in
                            VStack {
                                CommentCeil(p.1, isParent: true)
                                    .padding(.leading, 12)
                                    .zIndex(1)
                                ForEach(Array(p.2.enumerated()), id: \.1.0) { idx, c in
                                    let len: CGFloat = CGFloat((idx == 0
                                                                ? p.1 : p.2[idx - 1].1).filter { $0 == "\n" }.count)
                                    let _ = print(len)
                                    ZStack {
                                        CommentCeil(c.1, isParent: false)
                                            .padding(.leading, 44 + 12)
                                        let radius: CGFloat = 3
                                        let height: CGFloat = 62 + len * 20 + radius
                                        
                                        Path { path in
                                            path.move(to: CGPoint(x: 0, y: 0))
                                            path.addLine(to: CGPoint(x: 0, y: height))
                                            path.addArc(center: CGPoint(x: radius, y: height),
                                                        radius: radius,
                                                        startAngle: Angle(degrees: -180),
                                                        endAngle: Angle(degrees: 90),
                                                        clockwise: true)
                                            path.addLine(to: CGPoint(x: 16, y: height + radius))
                                        }
                                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                        .padding(.leading, 27)
                                        .foregroundStyle(Color.gray100)
                                        .offset(y: -height + 20)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .padding(.top, 16)
                    Rectangle()
                        .padding(.top, 24)
                        .foregroundStyle(Color.gray100)
                        .frame(maxWidth: .infinity)
                        .frame(height: 108)
                }
            }
            VStack {
                Spacer()
                Textfield()
            }
            .ignoresSafeArea()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        })
    }
}

#Preview {
    DetailPostView()
}
