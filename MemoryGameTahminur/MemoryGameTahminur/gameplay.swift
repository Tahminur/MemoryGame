//
//  gameplay.swift
//  MemoryGameTahminur
//
//  Created by Shumana Rahman on 12/18/18.
//  Copyright © 2018 Tahminur Rahman. All rights reserved.
//

import Foundation

//card.init(emoji: randemoji(emojis: avail_emojis), checkmatch: false) // have t put this in view controller most likely

class gameplay{
    var blank:Bool = true
    var cardsplayed:[Int] = []//contains the tag numbers all cards in clicked
    var cards = [card]()//contains list of cards
    var selected_emojis: [String]
    var moves_made: Int = 0
    var secretnum = 0//counts all clicks
    var easygame = 50 //if have time later change to allow different values for diferent difficulty
    init(){
        var x = 0
        //cards.append(card(emoji: randemoji(emojis: avail_emojis),matched: false,id: 0))
        selected_emojis = avail_emojis.shuffled() + avail_emojis.shuffled()
        while x<20{
            cards.append(card(emoji: selected_emojis[x],matched: false,id: x,display: false))
            x=x+1
        }
        cards = cards.shuffled()
    }
    
    func movesLeft()->Int{
        if easygame - secretnum/2 == 0{
        }
        return easygame - secretnum/2
    }
    func movesMadecalc()->Int{
        secretnum = secretnum + 1
        
        return secretnum/2
    }
    func checkinit(){
        print(cards)
    }//was to check if it works and it did
    
    func getEmoji(tag:Int)-> String{//should return a row and column number.
        var selected: String = ""
        var x = 0
        while x<20{
            if cards[x].id == tag{
                selected = cards[x].emoji
            }
            x=x+1
        }
        return selected
    }
    
    func IsMatch(tag1:Int,tag2:Int)->Bool{
        
        if getEmoji(tag: tag1) == getEmoji(tag: tag2) && tag1 != tag2{
            cards[tag1].matched = true
            cards[tag2].matched = true
            return true
        }
        else{
            return false
        }
    }
    
    func gameOver()->Bool{
        var x = 0
        var gameend = true
        let test = false
        while x<20{
            if cards[x].matched == false{
                gameend = test
                return test
            }
            x=x+1
        }
        return gameend
        //default case is false until all matches occur
    }
    //card.init(emoji: randemoji(emojis: avail_emojis), checkmatch: false)
    
    
}

