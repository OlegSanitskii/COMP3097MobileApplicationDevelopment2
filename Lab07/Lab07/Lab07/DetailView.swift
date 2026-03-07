
import SwiftUI

struct DetailView: View {
    
    let book: Book
    @Binding var path: NavigationPath        
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                Image(systemName: "book.closed.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.blue)
                    .padding(.top, 20)
                
                VStack(spacing: 10) {
                    Text(book.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("by \(book.author)")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Description")
                        .font(.headline)
                    
                    Text(book.shortDescription)
                        .foregroundStyle(.primary)
                    
                    Text("This screen shows the selected item from the Home screen. It demonstrates how data can be passed from one screen to another using SwiftUI navigation.")
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                
                NavigationLink {
                    InfoView(path: $path)
                } label: {
                    Label("About This App", systemImage: "info.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.top, 8)
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
