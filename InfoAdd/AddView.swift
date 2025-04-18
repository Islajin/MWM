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
                                
                                Spacer()
                                
                                Text("날짜와 시간을 선택해 주세요.")
                                
                                
                                
                                DatePicker(
                                    "",
                                    selection: $post.selectedDate,
                                    displayedComponents: [.date, .hourAndMinute]
                                )
                                .labelsHidden()
                                .tint(.mwmgreen)
                                
                                Spacer()
                                
                                Text("같이 밥 먹을 인원을 적어 주세요.")
                                
                                TextField("", text: $post.participantsString)
                                    .keyboardType(.numberPad)
                                    .frame(height: 30)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.green2, lineWidth: 1.5)
                                        )
                                                                Spacer()
                                
                                Text("원하는 메뉴를 적어 주세요.")
                                TextField("", text: $post.menu)
                                    .keyboardType(.default)
                                    .frame(height: 30)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.green2, lineWidth: 1.5)
                                        )
                                Spacer()
                                
                                Text("러너에게 하고 싶은 말을 적어 주세요.")
                                TextEditor(text: $post.mentorMessage)
                                    .keyboardType(.default)
                                    .frame(height: 180)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.green2, lineWidth: 1.5)
                                        )
                                
                                Spacer()
                                
                                Text("날짜와 시간을 한번 더 확인해주세요.")
                                
                                Spacer()
                                
                                
                                
                            }.padding(16)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.green2, lineWidth: 1.5))
                            
                        }.frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            
                                
                            
                        
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

