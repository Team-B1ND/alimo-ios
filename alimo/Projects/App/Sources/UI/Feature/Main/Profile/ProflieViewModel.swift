//
//  ProflieViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

fileprivate let memberCache = MemberCache.live

@MainActor
class ProfileViewModel: ObservableObject {
    
    private let memberService = MemberService.live
    
    @Published var categoryList: [String] = []
    
    
    @Published var isLoading = false
    
    func fetchCategoryList() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let roles = try await memberService.getCategoryList().roles
            categoryList = roles
            dump(roles)
        } catch {
            debugPrint(error)
        }
    }
    
    func byebye(onSuccess: @escaping () -> Void) async {
        do {
            _ = try await memberService.byebye()
            withAnimation {
                onSuccess()
            }
        } catch {
            debugPrint(error)
        }
    }
}
