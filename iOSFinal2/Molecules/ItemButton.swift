//
//  ItemButton.swift
//  iOSFinal2
//
//  Created by jose on 6/8/26.
//
import SwiftUI
struct ItemButton: View {
    var name: String
    var body: some View {
        ZStack {
            Text(name)
        }
        .frame(width: 100.0, height: 100.0)
        .background(
            Gradient(colors: [.teal, .cyan, .green]).opacity(
                0.6
            )
        ).cornerRadius(2.5)

    }
}
