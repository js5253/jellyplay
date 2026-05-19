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
        VStack() {
            Text("Sign in to your Jellyfin server").font(.title)
            Text("Server Address")
            HStack {
                TextField(text: $serverAddress, label: {Text("ASS")})
                Button(action: {
                    isCurrentlyCheckingServer = true
                }) {
                    Image(systemName:  "star.fill").foregroundStyle(isCurrentlyCheckingServer ? .red : .black)
                }
            }
            Text("Server Address")
            TextField(text: $serverAddress, label: {Text("ASS")})
            Text("Server Address")
            TextField(text: $serverAddress, label: {Text("ASS")})
            
            Button(action: {
            }) {
                Label("Sign In", systemImage: "arrow.up")
            }.disabled(isCurrentlyCheckingServer)
        }
            .textFieldStyle(.roundedBorder)
            .padding()

    }
}

#Preview {
    LoginPage()
}
