//
//  ThirdView.swift
//  TeachHerATrick
//
//  Created by Dorivaldo Marques da Silva Junior on 09/02/24.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    (Color (red: 159/255, green: 55/255, blue: 176/255).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                    VStack{
                        Text("""
                         
To teach Narset a trick give her a  command👮‍♂️, then if she has obeyed you, tap the 🍖 to click and give a treat. After being rewarded for the same command some times she will learn the trick and  will always do it when you ask.

"""
                        ).font(.system(size: 64, weight: .regular, design: .default))
                            .frame(width: 705
                            )
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(0)
                            
                        
                        
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


