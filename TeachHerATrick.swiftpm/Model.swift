//
//  Model.swift
//  TeachHerATrick
//
//  Created by Dorivaldo Marques da Silva Junior on 29/01/24.
//

import Foundation

struct Learning{
    let command: actions
    var listOfActions = [actions : Int]()
    var learnedCommand : actions?
    
    init(command: actions) {
        
        self.command = command
        self.listOfActions = [
                .dead : 0,
                .down : 0,
                .paw : 0,
                .seat : 0]
        
    }
}

enum actions{
    case dead
    case down
    case paw
    case seat
}


class Model: ObservableObject{
    public static var learning: Int = 0
    var learnings: [Learning] = [Learning(command: .dead), Learning(command: .down), Learning(command: .paw), Learning (command: .seat)]
    
    let arrayOfActions: [actions] = [.dead, .down, .paw, .seat]
    
    func executeLearnedAction(command: actions) -> Bool{
        for learning in learnings{
            if learning.command == command && learning.learnedCommand != nil{
                return true
            }
        }
        return false
    }
    
    func clickAndTreat(command: actions, randomIndex: Int) -> Int{
        
        
        var indexToGet : Int
        for (index, learning) in learnings.enumerated() {
            if learning.command == command{
                
                indexToGet = index
                for word in learning.listOfActions{
                    if word.key == arrayOfActions[randomIndex]{
                        var value = learning.listOfActions[word.key]!
                        value += 1
                        learnings[indexToGet].listOfActions[word.key] = value
                        //print (learnings)
                        if value >= 3{
                            learnings[indexToGet].learnedCommand = word.key
                            
                        }
                        return value
                    }
                    
                }
                
            }
            
        }
        return 0
        
    }
    
    
    
}






