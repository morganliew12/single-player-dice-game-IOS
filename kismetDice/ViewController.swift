//
//  ViewController.swift
//  kismetDice
//
//  Created by morgan liew on 26/09/2019.
//  Copyright © 2019 morgan liew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    var playerScore = 0
    var dice = [#imageLiteral(resourceName: "Kismet-Ace.png"), #imageLiteral(resourceName: "Kismet-Deuce"), #imageLiteral(resourceName: "Kismet-Trey"), #imageLiteral(resourceName: "Kismet-Four"), #imageLiteral(resourceName: "Kismet-Five"), #imageLiteral(resourceName: "Kismet-Six")]
    //           0   1   2   3   4   5
    var randomDiceIndex: Int = 0
    //for future we will need a current player.
    
    //MARK: Outlets
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
   //this gives the objects a functionality by linking them through swift.
 
    //MARK: Functions
    
    @IBAction func rollFunction(_ sender: Any){
        //when we have a sender: Any it can be anything e.g. button, scroll, picker.
        //dice logic below
        randomDiceIndex = Int.random(in: 0 ... 5)
        diceImage.image = dice[randomDiceIndex]
        //the dice image is = to the random dice index.
        print(randomDiceIndex + 1)
        playerScore += randomDiceIndex + 1
        //this makes our dice index increment e.g. rolling a one now = 1 instead of 0 due to index.
        scoreLabel.text = "\(playerScore)"
        rollLogicFunction()
        //this displays the score that the player has currently rolled.
    }
    
    func rollLogicFunction() {
        if(randomDiceIndex == 0){
            print("You lose.")
            messageLabel.text = "You lose."
            playerScore = 0
    //if the player gets a 1 (index 0), then the game resets to score 0 and displays a message saying "You lose.".
        }
        else if (playerScore >= 100) {
            print("You've won.")
            messageLabel.text = "You've Won."
            playerScore = 0
        //if the player gets a grand total of 100 or greater, then the game resets to score 0                       and displays a message saying "You've won.".
        }
        else {
            messageLabel.text = ""
            return
        //displaying the "label" as nothing until one of the above conditions is met.
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

