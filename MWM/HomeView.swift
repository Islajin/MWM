import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    
    @Query var posts: [MentorPostInfo]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(posts) { post in
                        Text(post.participantsString)
                    }
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddView()) {
                                                Image(systemName: "plus")
                                            }
                   
                }
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
