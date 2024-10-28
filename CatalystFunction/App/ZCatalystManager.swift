//
//  ZCatalystManager.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 28/10/24.
//

import Foundation
import ZCatalyst

public class ZCatalystManager {
    
    public class func initiate(window: UIWindow) throws {
        
        if !UserDefaults.standard.bool(forKey: "appLaunched") {
            UserDefaults.standard.set(true, forKey: "appLaunched")
            ZohoPortalAuth.clearZohoAuthPortalDetailsForFirstLaunch()
        }
        
        try ZCatalystApp.shared.initSDK(window: window, environment: .development)
    }
    
    class func isUserSignedIn() -> Bool {
        return ZCatalystApp.shared.isUserSignedIn()
    }
    
    class func getCurrentLoggedUserProfile() async throws -> ZCatalystUser {
        return try await withCheckedThrowingContinuation { continuation in
            ZCatalystApp.shared.getCurrentUser { result in
                switch result {
                case .success(let user):
                    continuation.resume(returning: user)
                case .error(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public class func presentLoginView(failure: @escaping (Error) -> Void) {
        ZCatalystApp.shared.showLogin { error in
            guard let error else { return }
            failure(error)
        }
    }
}
