import SwiftUI

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let shortDescription: String
}

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    let books: [Book] = [
        Book(
            title: "The Swift Programming Language",
            author: "Apple",
            shortDescription: "A great starting point for learning Swift fundamentals."
        ),
        Book(
            title: "Clean Code",
            author: "Robert C. Martin",
            shortDescription: "Helpful for writing cleaner and more readable code."
        ),
        Book(
            title: "Design Patterns",
            author: "Gamma, Helm, Johnson, Vlissides",
            shortDescription: "Introduces reusable software design solutions."
        ),
        Book(
            title: "Introduction to Algorithms",
            author: "Cormen et al.",
            shortDescription: "A classic resource for algorithms and problem solving."
        )
    ]
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            VStack(spacing: 16) {
                
                VStack(spacing: 8) {
                    Image(systemName: "books.vertical.fill")
                        .font(.system(size: 42))
                        .foregroundStyle(.blue)
                    
                    Text("Welcome to Book Explorer")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Choose a book to view details and learn more about this app.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                List(books) { book in
                    
                    NavigationLink(value: book) { 
                        HStack(spacing: 12) {
                            
                            Image(systemName: "book.fill")
                                .foregroundStyle(.blue)
                                .font(.title3)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Home")
            .navigationDestination(for: Book.self) { selectedBook in
                DetailView(book: selectedBook, path: $path)
            }
        }
    }
}

#Preview {
    ContentView()
}
