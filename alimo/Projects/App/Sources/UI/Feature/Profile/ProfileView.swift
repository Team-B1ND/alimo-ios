//
//  ProfileView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isOn: Bool = true
    
    @State var isCodeClicked: Bool = false
    @State var isAnimating: Bool = false
    
    @State var showDialog: Bool = false
    
    let dummyStudentCode: String = "Y2sH70"
    let dummyCategory: [String] = ["1학년", "바인드", "사운드체크", "사운드체크", "도서부", "교장선생님이 알립니다"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        
                        HStack {
                            AlimoLogo(type: .gray)
                            
                            Spacer()
                        }
                        .padding(.top, 60)
                        .padding(.horizontal, 20)
                        
                        Image(Asset.profileImage)
                            .padding(.top, 30)
                        
                        Text("김가영")
                            .font(Font.body)
                            .padding(.top, 10)
                        
                        Button {
                            showDialog = true
                        } label: {
                            Text("학생코드")
                                .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                                .foregroundStyle(Color.gray500)
                                .underline()
                        }
                        
                        FlowLayout(mode: .scrollable,
                                   items: dummyCategory) {
                            Text($0)
                                .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                                .foregroundStyle(Color.gray500)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.gray100)
                                .clipShape(Capsule())
                        }.padding()
                        
                        HStack {
                            Text("알림 설정")
                            Spacer()
                            AlimoToggle(isOn: $isOn)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }
                    .background(Color.main50)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        NavigationLink {
                            // 개인정보 이용 약관
                        } label: {
                            Rectangle()
                                .frame(height: 60)
                                .foregroundStyle(Color.main50)
                                .overlay {
                                    HStack {
                                        Text("개인정보 이용 약관")
                                            .font(Font.bodyLight)
                                            .foregroundStyle(.black)
                                        Spacer()
                                    }
                                    .padding(.leading, 20)
                                }
                        }
                        
                        NavigationLink {
                            // 서비스 정책
                        } label: {
                            Rectangle()
                                .frame(height: 60)
                                .foregroundStyle(Color.main50)
                                .overlay {
                                    HStack {
                                        Text("서비스 정책")
                                            .font(Font.bodyLight)
                                            .foregroundStyle(.black)
                                        Spacer()
                                    }
                                    .padding(.leading, 20)
                                }
                        }
                        
                        HStack {
                            Text("버전")
                                .font(Font.bodyLight)
                                .foregroundStyle(.black)
                            Spacer()
                            Text("v1.0.0")
                                .font(Font.custom(Pretendard.medium.rawValue, size: 16))
                                .foregroundStyle(Color.gray500)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        
                        Divider()
                        
                        Button {
                            // 로그아웃
                        } label: {
                            Text("로그아웃")
                                .font(Font.custom(Pretendard.medium.rawValue, size: 16))
                                .foregroundStyle(Color.red500)
                        }
                        .padding(.leading, 20)
                        .padding(.vertical, 20)
                        
                    }
                    .background(Color.main50)
                    
                }
                .ignoresSafeArea()
                .background(Color.gray100)
                
                VStack {
                    Spacer()
                    
                    RoundedCorner(radius: 4)
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .shadow(radius: 0)
                        .overlay {
                            HStack {
                                Text("복사에 성공하였습니다!")
                                    .font(Font.custom(Pretendard.bold.rawValue, size: 16))
                                
                                Spacer()
                                
                                Button {
                                    isCodeClicked = false
                                    isAnimating = false
                                } label: {
                                    
                                    Text("닫기")
                                        .font(Font.bodyLight)
                                        .foregroundStyle(Color.yellow)
                                    
                                }
                            }
                            .padding(.horizontal, 20)
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .offset(y : isAnimating ? 0 : 100)
                        .animation(.bouncy(duration: 0.5), value: isAnimating)
                    
                }
                
                if showDialog {
                    
                    Rectangle()
                        .opacity(0.3)
                        .ignoresSafeArea()
                        .overlay {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.white)
                                .frame(width: 290, height: 160)
                                .overlay {
                                    
                                    VStack {
                                        
                                        HStack {
                                            Text("\(dummyStudentCode)")
                                                .font(Font.custom(Pretendard.bold.rawValue, size: 20))
                                            
                                            Button {
                                                showDialog = false
                                                isCodeClicked = true
                                                isAnimating = true
                                            } label: {
                                                Image(Asset.copy)
                                            }
                                            
                                        }
                                        .padding(.bottom, 5)
                                        
                                        Text("부모님께만 공유해주세요")
                                            .font(Font.custom(Pretendard.medium.rawValue, size: 16))
                                            .foregroundStyle(Color.gray500)
                                            .padding(.bottom, 5)
                                        
                                        HStack {

                                            Spacer()
                                            
                                            Button {
                                                showDialog = false
                                            } label: {
                                                
                                                Text("닫기")
                                                    .foregroundStyle(Color.gray500)
                                                    .frame(width: 50, height: 40)
                                                    .background(Color.gray100)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                                
                                            }
                                        }
                                        .padding(.horizontal, 30)
                                        .padding(.bottom, 5)
                                        
                                    }
                                }
                                .padding(.bottom, 100)
                            
                        }
                }
            }
            
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
    }
}

public let flowLayoutDefaultItemSpacing: CGFloat = 4

public struct FlowLayout<RefreshBinding, Data, ItemView: View>: View {
    let mode: Mode
    @Binding var binding: RefreshBinding
    let items: [Data]
    let itemSpacing: CGFloat
    @ViewBuilder let viewMapping: (Data) -> ItemView
    
    @State private var totalHeight: CGFloat
    
    public init(mode: Mode,
                binding: Binding<RefreshBinding>,
                items: [Data],
                itemSpacing: CGFloat = flowLayoutDefaultItemSpacing,
                @ViewBuilder viewMapping: @escaping (Data) -> ItemView) {
        self.mode = mode
        _binding = binding
        self.items = items
        self.itemSpacing = itemSpacing
        self.viewMapping = viewMapping
        _totalHeight = State(initialValue: (mode == .scrollable) ? .zero : .infinity)
    }
    
    public var body: some View {
        let stack = VStack {
            GeometryReader { geometry in
                self.content(in: geometry)
            }
        }
        return Group {
            if mode == .scrollable {
                stack.frame(height: totalHeight)
            } else {
                stack.frame(maxHeight: totalHeight)
            }
        }
    }
    
    private func content(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        let itemCount = items.count
        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                viewMapping(item)
                    .padding([.horizontal, .vertical], itemSpacing)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= lastHeight
                        }
                        lastHeight = d.height
                        let result = width
                        if index == itemCount - 1 {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if index == itemCount - 1 {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(HeightReaderView(binding: $totalHeight))
    }
    
    public enum Mode {
        case scrollable, vstack
    }
}

private struct HeightPreferenceKey: PreferenceKey {
    static func reduce(value _: inout CGFloat, nextValue _: () -> CGFloat) {}
    static var defaultValue: CGFloat = 0
}

private struct HeightReaderView: View {
    @Binding var binding: CGFloat
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: HeightPreferenceKey.self, value: geo.frame(in: .local).size.height)
        }
        .onPreferenceChange(HeightPreferenceKey.self) { h in
            binding = h
        }
    }
}


public extension FlowLayout where RefreshBinding == Never? {
    init(mode: Mode,
         items: [Data],
         itemSpacing: CGFloat = flowLayoutDefaultItemSpacing,
         @ViewBuilder viewMapping: @escaping (Data) -> ItemView) {
        self.init(mode: mode,
                  binding: .constant(nil),
                  items: items,
                  itemSpacing: itemSpacing,
                  viewMapping: viewMapping)
    }
}
