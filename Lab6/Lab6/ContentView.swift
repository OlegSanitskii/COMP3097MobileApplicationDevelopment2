import SwiftUI

struct ContentView: View {

    @State private var value = 0
    @State private var step = 2
    @State private var showWarning = false
    @State private var warningText = ""

    var body: some View {

        ZStack {

            Color(red: 0.93, green: 0.86, blue: 0.56)
                .ignoresSafeArea()

            VStack(spacing: 25) {

                Image("gbc_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 80)

                Text("\(value)")
                    .font(.system(size: 34))
                    .frame(width: 150, height: 50)
                    .background(Color.white)
                    .cornerRadius(5)

                HStack(spacing: 30) {

                    Button(action: {
                        value -= step
                    }) {
                        Text("-")
                            .font(.system(size: 30))
                            .frame(width: 90, height: 45)
                            .background(Color.gray.opacity(0.6))
                            .foregroundColor(.black)
                    }

                    Button(action: {
                        value += step
                    }) {
                        Text("+")
                            .font(.system(size: 30))
                            .frame(width: 90, height: 45)
                            .background(Color.gray.opacity(0.6))
                            .foregroundColor(.black)
                    }
                }

                HStack(spacing: 30) {

                    Button(action: {
                        value = 0
                    }) {
                        Text("Reset")
                            .frame(width: 90, height: 45)
                            .background(Color.green)
                            .foregroundColor(.white)
                    }

                    Button(action: {

                        if step == 1 {
                            step = 2
                        } else {
                            step = 1
                        }

                        warningText = "Step is \(step)"

                        withAnimation {
                            showWarning = true
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                showWarning = false
                            }
                        }

                    }) {
                        Text("Step = \(step)")
                            .frame(width: 100, height: 45)
                            .background(Color.orange)
                            .foregroundColor(.white)
                    }
                }
            }

            if showWarning {
                Text(warningText)
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.opacity)
                    .offset(y: -170)
            }
        }
    }
}

#Preview {
    ContentView()
}
