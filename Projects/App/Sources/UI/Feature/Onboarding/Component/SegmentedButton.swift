//
//  RoleSelectionButton.swift
//  App
//
//  Created by dgsw8th36 on 7/30/24.
//  Copyright © 2024 b1nd. All rights reserved.
//

import SwiftUI
import ADS

enum RoleType {
    case Student
    case Parent
    case Teacher
    
    var image: AlimoImage {
        switch self {
        case .Student: AlimoImage.Student
        case .Parent: AlimoImage.Parent
        case .Teacher: AlimoImage.Teacher
        }
    }
    
    var disabledImage: AlimoImage {
        switch self {
        case .Student: AlimoImage.StudentDisabled
        case .Parent: AlimoImage.ParentDisabled
        case .Teacher: AlimoImage.TeacherDisabled
        }
    }
    
    var buttonText: String {
        switch self {
        case .Student: "학생"
        case .Parent: "학부모"
        case .Teacher: "선생님"
        }
    }
}

struct SegmentedButton: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    
    let buttonType: [RoleType]
    @Binding var isSelected: RoleType
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(buttonType, id: \.self) { item in
                let selected = isSelected == item
                Button {
                    isSelected = item
                } label: {
                    HStack(spacing: 0) {
                        Image(
                            image: selected
                            ? item.image
                            : item.disabledImage
                        )
                        .resizable()
                        .frame(width: 128, height: 113)
                        .toBottom()
                        Spacer()
                        Text("\(item.buttonText)")
                            .alimoFont(.headline2B)
                            .alimoColor(
                                selected
                                ? AlimoColor.Label.normal
                                : AlimoColor.Label.em
                            )
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .stroke(
                        12,
                        content: colorProvider.color(
                            isSelected == item
                            ? AlimoColor.Color.primary60
                            : AlimoColor.Label.back
                        ),
                        lineWidth: 1.5
                    )
                }
            }
        }
    }
}
