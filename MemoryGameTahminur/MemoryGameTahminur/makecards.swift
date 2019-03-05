//
//  makecards.swift
//  MemoryGameTahminur
//
//  Created by Shumana Rahman on 12/19/18.
//  Copyright © 2018 Tahminur Rahman. All rights reserved.
//

import Foundation

class makecards{
    var cards = [card]()
    var selected_emojis: [String]
    init(){
        //var check: Bool = false
        var x = 0
        //cards.append(card(emoji: randemoji(emojis: avail_emojis),matched: false,id: 0))
        selected_emojis = avail_emojis.shuffled() + avail_emojis.shuffled()
        while x<20{
            cards.append(card(emoji: selected_emojis[x],matched: false,id: x))
            x=x+1
        }
        cards = cards.shuffled()
    }
    func check(){
        print(cards)
    }//was to check if it works and it did
    func randemoji(emojis:[String]) ->String
    {
        let size = emojis.count - 1
        let index = Int.random(in: 0 ... size)
        return emojis[index]
    }
}
