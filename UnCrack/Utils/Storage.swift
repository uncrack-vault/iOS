//
//  Storage.swift
//  UnCrack
//
//  Created by Aritra on 16/03/24.
//

import Foundation

class Storage {
    
    static let shared = Storage()
    private init() {}
    
    @UserDefault(key: .isOnboardingDone)
    var isOnboardingDone: Bool?
}

extension Key {
    static let isOnboardingDone : Key = "isOnboardingDone"
}
