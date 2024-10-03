//
//  GameView.swift
//  TeachHerATrick
//
//  Created by Dorivaldo Marques da Silva Junior on 09/02/24.
//

import SwiftUI

struct GameView1: View {
    @EnvironmentObject  var viewModel: Model
    @State private var randomImageIndex = Int.random(in: 0..<4)
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    VStack {
                        
                        Image("Title")
                        
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                            .padding(64)
                        
                        Image("Standard")
                            .resizable()
                            .frame(width: 400,height: 460)
                            .padding(0)
                            .aspectRatio(contentMode: .fit)
                        
                            .edgesIgnoringSafeArea(.all)
                        
                        
                        Color (red: 159/255, green: 55/255, blue: 176/255)
                        
                        NavigationLink(destination: GameView2(viewModel: viewModel, randomImageIndex: randomImageIndex, command: .dead )){
                            Image("DeadCommand").padding(8)
                        }.simultaneousGesture(TapGesture().onEnded{
                            if viewModel.executeLearnedAction(command: .dead){
                                randomImageIndex = 0
                            }else{
                                randomImageIndex = Int.random(in: 0..<4)
                            }})
                        
                        NavigationLink(destination: GameView2(viewModel: viewModel, randomImageIndex: randomImageIndex, command: .down )){
                            Image("DownCommand").padding(8)
                        }.simultaneousGesture(TapGesture().onEnded{
                            if viewModel.executeLearnedAction(command: .down){
                                randomImageIndex = 1
                            }else{
                                randomImageIndex = Int.random(in: 0..<4)
                            }})
                        
                        NavigationLink(destination: GameView2(viewModel: viewModel, randomImageIndex: randomImageIndex, command: .paw )){
                            Image("PawCommand").padding(8)
                        }.simultaneousGesture(TapGesture().onEnded{
                            if viewModel.executeLearnedAction(command: .paw){
                                randomImageIndex = 2
                            }else{
                                randomImageIndex = Int.random(in: 0..<4)
                            }})
                        
                        NavigationLink(destination: GameView2(viewModel: viewModel, randomImageIndex: randomImageIndex, command: .seat )){
                            Image("SeatCommand").padding(8)
                        }.simultaneousGesture(TapGesture().onEnded{
                            if viewModel.executeLearnedAction(command: .seat){
                                randomImageIndex = 3
                            }else{
                                randomImageIndex = Int.random(in: 0..<4)
                            }})
                        
                        
                        
                        
                        
                        
                        
                    }
                }}
            .background(Color (red: 159/255, green: 55/255, blue: 176/255)).ignoresSafeArea(.all)
        }
    }
}
#Preview {
    GameView1()
}


