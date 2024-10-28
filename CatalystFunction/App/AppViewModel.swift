//
//  AppViewModel.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 26/10/24.
//

import Foundation
import UIKit

@MainActor
class AppViewModel: ObservableObject {
    static let shared: AppViewModel = AppViewModel()
    
    private init() {}
    
    @Published var toastMessage: String? = nil
    @Published var isPresentToast: Bool = false
    @Published private(set) var isUserLogged: Bool = false
    
    var getWindow: UIWindow? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first {
            return window
        }
        
        return nil
    }
    
    func initiate(window: UIWindow) {
        // Initiate ZCatalyst
        do {
            try ZCatalystManager.initiate(window: window)
            isUserLogged = ZCatalystManager.isUserSignedIn()
        }catch {
            presentToast(message: error.localizedDescription)
        }
    }
    
    func presentToast(message: String) {
        self.toastMessage = message
        self.isPresentToast.toggle()
    }
}
