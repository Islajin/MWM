import SwiftUI
import SwiftData

@Model
class User {
    var id : String
    var password : String
    
    init(id: String, password: String) {
        self.id = id
        self.password = password
    }
}


struct LoginView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    
    @State private var inputId: String = ""
    @State private var inputPassword: String = ""
    @State private var loginSuccess: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack () {
                
                TextField("아이디", text: $inputId)
                
                SecureField("비밀번호", text: $inputPassword)
                
                Button ("로그인") {
                    if users.first(where: { $0.id == inputId && $0.password == inputPassword }) != nil {
                        loginSuccess = true
                        print("로그인 성공")
                    } else {print("로그인 실패") }
                    
                }.navigationDestination(isPresented: $loginSuccess){
                    HomeView()}
                
            }.onAppear {
                if users.isEmpty {
                    insertDefaultUser()
                }
            }
        }
        
    }
    
    
    private func insertDefaultUser() {
        let defaultUsers = [
            User(id:"Dora", password:"Dora"),
            User(id:"Isla", password:"2"),
            User(id:"Jason", password:"3")
        ]
        
        for user in defaultUsers {
            modelContext.insert(user)
        }
        
        do {
            try modelContext.save()
        }
        catch {
            
        }
    }
    
}

#Preview {
    LoginView()
}
    

