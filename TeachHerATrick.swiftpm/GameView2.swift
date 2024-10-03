//
//  GameView2.swift
//  TeachHerATrick
//
//  Created by Dorivaldo Marques da Silva Junior on 09/02/24.
//

import SwiftUI
import AVFoundation

struct GameView2: View {
    @EnvironmentObject var viewModel: Model
    @Environment (\.presentationMode) var presentationMode
    @State private var player: AVAudioPlayer?
    //var clickerPlayer: AVPlayer
    var randomImageIndex: Int
    @State private var emojiOffset: CGSize = .zero
    @State private var gaveTreat = true
    @State private var didNotObey = true
    @State private var animationComplete = false
    @State private var opacityValue: Double = 1.0
    @State private var opacityValue2: Double = 1.0
    @State private var opacityValue3: Double = 0
    @State private var starOpacityValue: Double = 0
    @State private var learningViewBool: Bool = false
    @State private var learning: Int = 0
    @State private var meatOpacityValue: Double = 1
    
    init (viewModel: Model, randomImageIndex: Int, command: actions){
         
       self.randomImageIndex = randomImageIndex
       self.command = command
   }
    var command: actions
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    VStack {
                        
                        Image("Title")
                        
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                            .padding(64)
                        ZStack{
                            Image("action\(randomImageIndex)")
                                .padding(0)
                                .aspectRatio(contentMode: .fit)
                            
                                .edgesIgnoringSafeArea(.all)
                            
                            Image("Angry")
                                .opacity(1 - opacityValue2)
                            Image("EmojiFood")
                                .opacity(1 - opacityValue)
                            
                            
                            NavigationLink(destination: GameView1()){
                                Image("LearnedTrick")
                                    .opacity(opacityValue3)
                            }
                            NavigationLink(destination: LearningView(screen: Model.learning)){
                                Image("Star")
                                    .opacity(starOpacityValue)
                            }.disabled(learningViewBool)
}
                        Color (red: 159/255, green: 55/255, blue: 176/255)
                        HStack{
                            
                            Image("Nope")
                            
                            ZStack{
                                Image ("Circle")
                                Image("X").offset(y: didNotObey ? 0 : -400).opacity(opacityValue2)
                                    .simultaneousGesture(TapGesture().onEnded({
                                        playSound(named: "bark\(randomImageIndex)")
                                        //self.player.play()
                                        withAnimation(.easeIn(duration: 1.0)){
                                            didNotObey.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 0.5).delay (1.0)){
                                            opacityValue2 = 0.0
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            self.presentationMode.wrappedValue.dismiss()
                                                        }
                                        
                                        
                                    }))
                            }
                            ZStack{
                                //NavigationLink(destination: GameView1()){
                                Image("Circle")
                                Image ( "MeatOnBone").offset(y: gaveTreat ? 0 : -400).opacity(opacityValue).opacity(meatOpacityValue)
                                //   }
                                    .simultaneousGesture(TapGesture().onEnded{
                                        Model.learning += 1
                                        if Model.learning > 2 {
                                            learningViewBool.toggle()
                                        }
                                        playSound(named: "clicker")
                                        //self.clickerPlayer.play()
                                        if viewModel.clickAndTreat(command: command, randomIndex: randomImageIndex) == 3{
                                            withAnimation(.easeIn(duration: 1.0)){
                                                opacityValue3 = 1.0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                            self.presentationMode.wrappedValue.dismiss()
                                            }
                                        }else{
                                            withAnimation(.easeIn(duration: 1.0)){
                                                gaveTreat.toggle()
                                            }
                                            withAnimation(.easeInOut(duration: 0.5).delay  (1.0)){
                                                opacityValue = 0.0
                                            }}
                                        if Model.learning == 1 || Model.learning == 2{
                                         withAnimation(.easeInOut(duration: 0.5).delay(1.5)){
                                             starOpacityValue = 1
                                             opacityValue = 1
                                             meatOpacityValue = 0
                                             
                                         }} else {
                                         DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                         self.presentationMode.wrappedValue.dismiss()
                                         }}
                                        
                                    })
                            }
                            Image ("ClickTreat")
                            
                            
                            
                        }}
                    
                    
                }
                
            }.background(Color (red: 159/255, green: 55/255, blue: 176/255)).ignoresSafeArea(.all)
        }}
    
    private func playSound(named name: String) {
        if let soundFilePath = Bundle.main.path(forResource: name, ofType: "wav") {
            let soundURL = URL(fileURLWithPath: soundFilePath)
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
}


