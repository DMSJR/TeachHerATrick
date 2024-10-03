//
//  SecondView.swift
//  TeachHerATrick
//
//  Created by Dorivaldo Marques da Silva Junior on 09/02/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    (Color (red: 159/255, green: 55/255, blue: 176/255).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                    VStack{
                        Text("""
                         
Trainning your dog 🐶 has many benefits: you bond to your pet ❤️, he or she gets more confident 😎 and it decreases unwanted behavior 😇. In addition, it’s EXTREMELY FUN!!
"""
                        ).font(.system(size: 64, weight: .regular, design: .default))
                            .frame(width: 705
                            )
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(0)
                            
                        VStack{
                            
                            NavigationLink(destination: ThirdView()){                
                                Image("Next")
                                
                            }
                            
                        }.padding(32)
                    }
                }
                
            }.background(Color(red: 171/255, green: 63/255, blue: 188/255))
        }
    }}
#Preview {
    SecondView()
}
