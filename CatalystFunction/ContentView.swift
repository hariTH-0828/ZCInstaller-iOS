//
//  ContentView.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if AppViewModel.shared.isUserLogged {
            HomeView()
        }else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
