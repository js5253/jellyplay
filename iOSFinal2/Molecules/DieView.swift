import SwiftUI

struct DieView: View {
    @State private var hovered = false
    var body: some View {
        withAnimation {
            VStack {
                Text("Bored? Have decision fatigue?").font(.body).foregroundStyle(.gray)
                Button("Roll The Die", action: {}).font(.title)
                
            }
            .frame(maxWidth: .infinity, idealHeight: 200)
            .padding()
            //        .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 30.0, style: .continuous))
            .glassEffect(in: RoundedRectangle(cornerRadius: 30.0, style: .continuous).fill(hovered ? .blue : .gray).shape)
            .padding()
            .onHover { hovering in
                hovered = hovering
            }
        }
    }
}

#Preview {
    DieView()
}
