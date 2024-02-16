//
//  HomeViewModel.swift
//  App
//
//  Created by dgsw8th61 on 2/16/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let homeService = HomeService.live
    @Published var category : [String] = []

    
    func getcategory() async {
        do {
            let tokenResponse = try await homeService.getcategory()
            self.category = tokenResponse.data.roles
        } catch {
            
        }
    }
}


