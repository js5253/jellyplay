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
                TextField(text: $serverAddress, label: {Text(verbatim: "https://example.com")})
                Button(action: {
                    isCurrentlyCheckingServer = true
                }) {
                    Image(systemName:  "star.fill").foregroundStyle(isCurrentlyCheckingServer ? .red : .black)
                }
            }
            Text("Username")
            TextField(text: $serverAddress, label: {Text("")})
            Text("Password")
            TextField(text: $serverAddress, label: {Text("")})
            
            Button(action: {
            }) {
                Label("Sign In", systemImage: "arrow.up")
            }.background(.blue).clipShape(.buttonBorder).frame(maxWidth: .infinity).foregroundStyle(.white).disabled(isCurrentlyCheckingServer)
                .padding()
        }
            .textFieldStyle(.roundedBorder)
            .padding()

    }
}

#Preview {
    LoginPage()
}
