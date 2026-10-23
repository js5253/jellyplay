//
//  LoginPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

enum ValidateStatus {
    case notValidated
    case failed
    case valid
}

struct LoginPage: View {
    @State var serverAddress: String = ""
    @State var serverUsername: String = ""
    @State var serverPassword: String = ""
    @State var validateStatus: ValidateStatus = .notValidated
    @State var isCurrentlyCheckingServer: Bool = false
    
    var body: some View {
        withAnimation {
            
            HStack(alignment: .bottom) {
                Divider()
                VStack {
                    if (isCurrentlyCheckingServer) {
                        ProgressView()
                    } else {
                        Text("Sign in to your Jellyfin server").font(.title)
                        
                        HStack {
                            Text("Server Address")
                            TextField(
                                text: $serverAddress,
                                label: { Text(verbatim: "https://example.com") }
                            )
                            .keyboardType(.URL)
                        }
                        switch(validateStatus) {
                        case .failed:
                            Image(systemName: "heart.fill")
                        case .notValidated:
                            Image(systemName: "heart.outline")
                        case .valid:
                            Image(systemName: "heart.fill")

                        }
                        Button(action: {
                            Task {
                                isCurrentlyCheckingServer = true
                                
                                do {
                                    try await JellyfinService.shared.getServerConfig(
                                        serverBase: serverAddress
                                    )
                                } catch {
                                    ErrorService.shared.handleError(description: error)
                                }
                                isCurrentlyCheckingServer = false
                            }
                        }) {
                            
                            Text("Validate Server")
                        }
                        .frame(maxWidth: CGFloat.infinity)
                        .buttonStyle(.bordered)
                        .environment(\.colorScheme, .dark)
                        .padding()
                        HStack {
                            Text("Username")
                            TextField(text: $serverUsername, label: { Text("") })
                        }
                        HStack {
                            Text("Password")
                            SecureField(text: $serverPassword, label: { Text("") })
                        }
                        
                        Button(action: {
                            Task {
                                isCurrentlyCheckingServer = true
                                try await JellyfinService.shared.logIn(
                                    serverAddress: serverAddress,
                                    username: serverUsername,
                                    password: serverPassword
                                )
                                isCurrentlyCheckingServer = false
                            }
                        }) {
                            Label("Sign In", systemImage: "arrow.up")
                                .padding()
                        }.background(.blue).clipShape(.buttonBorder).frame(
                            maxWidth: .infinity
                        ).foregroundStyle(.white).disabled(isCurrentlyCheckingServer)
                        
                    }
                }
                        .frame(maxWidth: CGFloat.infinity)
                        .padding(0)
//                        .foregroundStyle(.white)
//                        .background(Color.black)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                    
            }
        }
    }
}

#Preview {
    LoginPage()
}
