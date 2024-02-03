//
//  Contents.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailContents : View {
    var body: some View {
        
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
    }
        
}

#Preview {
    DetailContents()
}
