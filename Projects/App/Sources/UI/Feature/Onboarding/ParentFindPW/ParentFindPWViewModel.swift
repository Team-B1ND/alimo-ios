//
//  ParentFindPWViewModel.swift
//  App
//
//  Created by dgsw8th36 on 7/31/24.
//  Copyright © 2024 b1nd. All rights reserved.
//

import Foundation
import SwiftUI

@MainActor
class ParentFindPWViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var authCode: String = ""
    @Published var newPw: String = ""
}
