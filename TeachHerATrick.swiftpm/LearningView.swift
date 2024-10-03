

import SwiftUI

struct LearningView: View { 
    var screen: Int
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    (Color (red: 159/255, green: 55/255, blue: 176/255).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                    VStack{
                        if screen == 1{
                            Text("""
                         
You have begun teaching ✍️ Narset a trick. She is extremely smart 🧠, so If you do it two more times for the same command she will learn it!!

"""
                            ).font(.system(size: 64, weight: .regular, design: .default))
                                .frame(width: 705
                                )
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(0)
                        }
                        else{
                                Text("""
                                 
        The clicker sound you hear👂 shows Narset that she has done something right ✅ immediately!!

        """
                                ).font(.system(size: 64, weight: .regular, design: .default))
                                    .frame(width: 705
                                    )
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(0)
                        }
                        
                        
                        VStack{
                            
                            NavigationLink(destination: GameView1()){                  Image("OK")
                                
                            }
                            
                        }.padding(32)
                    }
                }
            }.background(Color(red: 171/255, green: 63/255, blue: 188/255))
        }
    }
}
#Preview {
    ThirdView()
}



