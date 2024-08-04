//
//  ViewExt.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI


struct AlimoAnimationButton: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .addPressAnimation(configuration.isPressed)
    }
}

extension View {
    func alimoToolbar(_ title: String,
                     imageColor: Color = .black,
                     onClick: @escaping () -> Void) -> some View {
        self.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button {
                        onClick()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(imageColor)
                    }
                    
                    Text(title)
//                        .font(.subtitle) // TODO
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

extension View {
    func showShadow(show: Bool) -> some View {
        Group {
            if show {
                self
                    .shadow(color: Color.black.opacity(0.08), radius: 18, y: 6)
            } else {
                self
            }
        }
    }
}
