import SwiftUI
import SwiftData


@Model
class MentorPostInfo{
    var selectedDate : Date
    var participantsString : String
    var menu : String
    var mentorMessage : String
    
    init(selectedDate: Date, participantsString: String, menu: String, mentorMessage: String) {
        self.selectedDate = selectedDate
        self.participantsString = participantsString
        self.menu = menu
        self.mentorMessage = mentorMessage
    }
    
}



struct AddView: View {
    @Environment(\.modelContext) private var mentorInfoContext
    
    @State private var post = MentorPostInfo (
        selectedDate: Date(), participantsString: "" , menu: "", mentorMessage: ""
    )
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.background
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        ZStack(alignment: .top){
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                            
                            VStack(alignment: .leading, spacing:16){
                                HStack{
                                    Image("mwmrice")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                    
                                    Text("로그인된 멘토 이름")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                
                                Text("날짜와 시간을 선택해 주세요.")
                                
                                Text("같이 밥 먹을 인원을 적어 주세요.")
                                
                                TextField("", text: $post.participantsString)
                                    .keyboardType(.numberPad)
                                
                                          
                                Text("원하는 메뉴를 적어 주세요.")
                                
                                Text("러너에게 하고 싶은 말을 적어 주세요.")
                                
                                Text("날짜와 시간을 한번 더 확인해주세요.")
                                
                                
                                Spacer()
                                
                                
                            }.padding(16)
                            
                        }.frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                            .padding(.top, 24)
                        
                    } .padding(.bottom, 40)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("완료") {
                        dismiss()
                        mentorInfoContext.insert(post)
                    }
                }
            }
        }
    }
}

#Preview {
    AddView()
}

