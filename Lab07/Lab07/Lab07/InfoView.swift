import SwiftUI

struct InfoView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Image(systemName: "info.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(.blue)
            
            Text("About This App")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Book Explorer is a simple SwiftUI app created to demonstrate multi-screen navigation using NavigationStack, NavigationLink, and data passing between views.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .padding(.horizontal)
            
            Text("Navigation flow: Home → Book Details → About This App")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            
            Button {
                path = NavigationPath()
            } label: {
                Label("Back to Home", systemImage: "house.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("App Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}
