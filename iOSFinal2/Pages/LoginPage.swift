//
//  LoginPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct LoginPage: View {
    @State var serverAddress: String = ""
    @State var serverUsername: String = ""
    @State var serverPassword: String = ""
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
                        .padding()
                        .background(Color.white)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                    
                }.background(Color.gray)
        }
    }
}

#Preview {
    LoginPage()
}
