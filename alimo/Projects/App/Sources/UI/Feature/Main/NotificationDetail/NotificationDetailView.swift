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

struct NotificationDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isButtonPressed = false
    
    @ViewBuilder
    private var comment: some View {
        LazyVStack {
            ForEach(dummyComment, id: \.0) { p in
                VStack {
                    CommentCeil(p.1, isParent: true)
                        .padding(.leading, 12)
                        .zIndex(1)
                    ForEach(Array(p.2.enumerated()), id: \.1.0) { idx, c in
                        let len: CGFloat = CGFloat((idx == 0
                                                    ? p.1 : p.2[idx - 1].1).filter { $0 == "\n" }.count)
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
    }
    
    @ViewBuilder
    private var content: some View {
        HStack(spacing: 8) {
            VStack {
                AlimoAvatar().padding(.leading, 12)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                ProfileCeil()
                DetailContents()
                    .padding(.top, 12)
                Text("2023년 1월 33일 25시 -1분")
                    .foregroundStyle(Color.gray500)
                    .font(.cute)
                    .padding(.top, 12)
                
                HStack {
                    Spacer()
                    
                    Button {
                        isButtonPressed.toggle()
                    } label: {
                        Image(isButtonPressed ? AppAsset.Assets.clickedBookmark.name : AppAsset.Assets.bookmark.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.top, 12)
            }
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    content
                        .padding(.top, 20)
                        .padding(.trailing, 16)
                        .padding(.bottom, 12)
                    Divider()
                    Emoji()
                        .padding(.top, 16)
                    comment
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
    NotificationDetailView()
}
