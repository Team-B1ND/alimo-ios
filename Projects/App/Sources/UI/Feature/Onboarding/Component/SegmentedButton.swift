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
    
    var image: Image {
        switch self {
        case .Student: Image(image: .Student)
        case .Parent: Image(image: .Parent)
        case .Teacher: Image(image: .Teacher)
        }
    }
    
    var disabledImage: Image {
        switch self {
        case .Student: Image(image: .StudentDisabled)
        case .Parent: Image(image: .ParentDisabled)
        case .Teacher: Image(image: .TeacherDisabled)
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
        ForEach(buttonType, id: \.self) { item in
            let image = isSelected == item ? item.image : item.disabledImage
            let selectedColor = isSelected == item ? AlimoColor.Label.normal : AlimoColor.Label.em
            
            Button {
                isSelected = item
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .foregroundStyle(.clear)
                    .overlay {
                        HStack {
                            image
                                .resizable()
                                .frame(width: 128, height: 113)
                            Spacer()
                            Text("\(item.buttonText)")
                                .alimoFont(.headline2B)
                                .alimoColor(selectedColor)
                            Spacer()
                        }
                        if isSelected == item {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(colorProvider.color(AlimoColor.Color.primary60), lineWidth: 2)
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(colorProvider.color(AlimoColor.Label.back), lineWidth: 2)
                        }
                    }
                    .padding(.horizontal, 20)
            }
            
        }
    }
}
