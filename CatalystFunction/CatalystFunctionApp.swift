//
//  CatalystFunctionApp.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 25/10/24.
//

import SwiftUI
import ZCatalyst
import Toast

@main
struct CatalystFunctionApp: App {
    @StateObject private var appViewModel: AppViewModel = AppViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .showToast(message: appViewModel.toastMessage, isShowing: $appViewModel.isPresentToast)
                .onAppear(perform: {
                    if let window = appViewModel.getWindow {
                        appViewModel.initiate(window: window)
                    }
                })
        }
    }
}
