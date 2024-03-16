//
//  DialogManager.swift
//  App
//
//  Created by dgsw8th71 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
final class DialogManager: ObservableObject {
    
    enum Phase {
        case none
        case show
    }
    
    @Published var phase: Phase = .none
    
}
