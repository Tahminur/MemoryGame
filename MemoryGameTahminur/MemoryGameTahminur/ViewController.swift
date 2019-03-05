//
//  ViewController.swift
//  MemoryGameTahminur
//
//  Created by Tahminur Rahman on 12/17/18.
//  Copyright © 2018 Tahminur Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var newgame = gameplay()
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMovesLeft.text = String(newgame.movesLeft())
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var lblMovesLeft: UILabel!
    @IBOutlet weak var lblMovesMade: UILabel!
    
    @IBAction func btnClick(_ sender: UIButton) {
        var newLabel: String
        var image:UIImage = UIImage()
        var labels:String//labels to reset buttons that are not matched
        var dragon:UIImage = UIImage()//image of dragon saved for convenience
        dragon = (UIImage(named: "dragons.jpg") as UIImage?)!

        lblMovesMade.text = String(newgame.movesMadecalc())
        lblMovesLeft.text = String(newgame.movesLeft())
        
        
        if let label = sender.titleLabel!.text{
            newLabel = label
        }else{
            newLabel = ""
        }
        if newLabel != "" && newgame.blank == true && newgame.cards[sender.tag].matched == false && newgame.cards[sender.tag].display == false
        {
            image = (UIImage(named: "dragons.jpg") as UIImage?)!
            newLabel = ""
            newgame.blank = false
        }else{
            image = UIImage()//this is a blank image
            newgame.blank = true
            newgame.cardsplayed.append(sender.tag)
            //print(newgame.cardsplayed)
            newgame.cards[sender.tag].display = true
            newLabel = newgame.getEmoji(tag: sender.tag)//the emoji will go here. You will have to create a model that contains a 2d array of your emojis and gameboard. Will have to keep track if it was selected, if it matched these can be put intoa struct, which will keep track of your gameplay
            //if newgame.IsMatch(tag1: newgame.cardsplayed[newgame.cardsplayed.count-1], tag2: newgame.cardsplayed[newgame.cardsplayed.count-2]){
               // newgame.cards[sender.tag].display = true
               // newgame.cards[newgame.cardsplayed[newgame.cardsplayed.count-2]].display = true
               // print(newgame.secretnum%2)
            }
        if newgame.secretnum%2 != 1{
            if newgame.IsMatch(tag1: newgame.cardsplayed[newgame.cardsplayed.count-1], tag2: newgame.cardsplayed[newgame.cardsplayed.count-2]){
                //newgame.cards[sender.tag].display = true
                //newgame.cards[newgame.cardsplayed[newgame.cardsplayed.count-2]].display = true
                print(newgame.secretnum%2)
            }
            else{//have to have code that reflips the two flipped pictures over again
                labels = ""
                for case let button as UIButton in self.view.subviews {
                    if newgame.cards[button.tag].matched == false && newgame.cards[button.tag].display == true {
                        button.setBackgroundImage(dragon, for: UIControl.State.normal)//reflips all cards that are not matched.
                        button.setTitle(labels, for: UIControl.State.normal)
                        
                    }
                }
            }
        }
        if newgame.secretnum>2{
            newgame.IsMatch(tag1:newgame.cardsplayed[newgame.cardsplayed.count-1], tag2: newgame.cardsplayed[newgame.cardsplayed.count-2])
        }
        
        print(newgame.secretnum%2)
        if newgame.gameOver(){
            for view in self.view.subviews{
                view.removeFromSuperview()
                //here add in code for winner or loser
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
                label.font = label.font.withSize(48)
                label.center = CGPoint(x: 200, y: 285)
                label.textAlignment = .center
                label.text = "Winner"
                self.view.addSubview(label)
                
                }
            }//winner scenario
        if lblMovesLeft.text == "0"{
            for view in self.view.subviews{
                view.removeFromSuperview()
                //here add in code for winner or loser
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
                label.font = label.font.withSize(48)
                label.center = CGPoint(x: 200, y: 285)
                label.textAlignment = .center
                label.text = "You lost"
                self.view.addSubview(label)
                //code to add button
                /*let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
                button.backgroundColor = .green
                button.setTitle("Test Button", for: .normal)
                
                self.view.addSubview(button)*/
            }
        }//loser scenario
        sender.setTitle(newLabel, for: UIControl.State.normal)
        sender.setBackgroundImage(image, for: UIControl.State.normal)
        
        /*code to add button
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        
        self.view.addSubview(button)
 */
        }
        //sender.setTitle(newLabel, for: UIControl.State.normal)
        //sender.setBackgroundImage(image, for: UIControl.State.normal)
    }

