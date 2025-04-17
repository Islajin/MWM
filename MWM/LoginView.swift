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
    @Binding var loginSuccess : Bool
    
    
    var body: some View {
            ZStack {
                Color.background
                
                VStack (spacing: 60) {
                    VStack() {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                }
                    
                VStack(spacing: 20) {
                    TextField("아이디", text: $inputId)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    
                    SecureField("비밀번호", text: $inputPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    
                }.padding(.horizontal, 20)
               
                
                Button ("로그인") {
                    if users.first(where: { $0.id == inputId && $0.password == inputPassword }) != nil {
                        loginSuccess = true
                        print("로그인 성공")
                    } else {print("로그인 실패") }
                    
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.logingreen)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.bottom, 90)
                
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
    }
    
}


