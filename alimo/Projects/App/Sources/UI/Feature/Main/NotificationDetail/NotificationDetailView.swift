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
    @State var commentText = ""
    
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
                AlimoAvatar()
                    .padding(.leading, 12)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                ProfileCeil()
                
                Text("""
            여러분들은 이제 2학년입니다. 인문계면 이때의 공부한 걸로 대학이 거의 결정되고, 특성화인 여러 분들은 여러 분들은 지금부터의 공부가 여러 분들의
            취업 방향이 결정됩니다.
            여기는 소프트웨어고라고는 하지만 거의 웹개발고등학교라도 해도 무방할 정도로 웹개발에 대해 집중하고 있고, 수업도 그렇게 진행이 되고 있습니다.
            2학년때는 여러분들 취업에 쓸 포트폴리오를 위한 프로젝트를 진행합니다. 많은 시간을 주어지지만 기초가 없으면 다시 처음부터 공부를 해야합니다.
            고로 기초(자바, 파이썬, HTML, C언어 등)가 약하다면 먼저 기본 문법을 떼기 바랍니다.
            https://wikidocs.net/book/1 (점프 투 파이썬)
            https://wikidocs.net/book/31 (점프 투 자바)
            https://wikidocs.net/book/4701 (웹을 알고싶다면?? HTML5 & CSS3부터)
            https://wikidocs.net/book/2494 (C 프로그래밍: 현대적 접근) <- 대학 2학년때 1학년 후배들 대상으로 C강의 때 예제
            """)
                .font(.caption)
                .lineSpacing(5)
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
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .cornerRadius(5)
                        .shadow(color: .gray300, radius: 3, x: 0, y: -3)
                    
                    TextField("댓글을 남겨보세요", text: $commentText)
                        .padding(.bottom,20)
                        .padding(.leading,25)
                    HStack{
                        Spacer()
                        Button(action: {
                            //댓글 보내기
                        }, label: {
                            Image("Send")
                            
                        })
                        .padding(.bottom,20)
                        .padding(.trailing,25)
                    }
                }
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
