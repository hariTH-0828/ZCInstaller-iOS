//
//  LoginView.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 28/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var toastMessage: String?
    @State private var isPresentToast: Bool = false
    
    var body: some View {
        NavigationStack {
            GeometryReader(content: { geometry in
                VStack(spacing: 0) {
                    loginOnBoardImageView()
                    
                    loginContentView(geometry)
                    
                    loginButtonView(geometry)
                }
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .showToast(message: toastMessage, isShowing: $isPresentToast)
        }
    }
    
    @ViewBuilder
    private func loginOnBoardImageView() -> some View {
        Image(.loginOnBoard)
            .resizable()
            .frame(width: 300, height: 300)
            .scaledToFit()
            .padding()
    }
    
    @ViewBuilder
    private func loginContentView(_ geometry: GeometryProxy) -> some View {
        Text("Welcome to ZInstaller")
            .font(.system(size: 25.0, weight: .bold))
            .padding()
        
        Text("Now Inhouse application are easy to install with this application, no more expiration link")
            .padding(.horizontal)
            .font(.system(size: 16.0))
            .foregroundStyle(Color(uiColor: .systemGray))
            .padding(.bottom, 60)
    }
    
    @ViewBuilder
    private func loginButtonView(_ geometry: GeometryProxy) -> some View {
        Button(action: {
            ZCatalystManager.presentLoginView { error in
                toastMessage = error.localizedDescription
                isPresentToast.toggle()
            }
        }, label: {
            Text("Login")
                .frame(width: geometry.size.width / 1.5, height: 35)
                .font(.system(size: 22, weight: .medium))
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.tintColor)
                )
                .padding()
        })
    }
}

#Preview {
    LoginView()
}

extension Color {
    static let tintColor: Color = {
        return Color(uiColor: UIColor(red: 0.18, green: 0.35, blue: 1.00, alpha: 1.00))
    }()
}
