//
//  ViewController.swift
//  Memory-Game
//
//  Created by Lucas Eduardo Backes on 10/10/20.
//

import UIKit

let gameCards: [String] = [
    "Dwarf",
    "Elv",
    "Knight",
    "Witch",
    "Wizard",
    "Dwarf",
    "Elv",
    "Knight",
    "Witch",
    "Wizard",
]

class ViewController: UIViewController {
    var currentGame: MemoryGame = MemoryGame(shuffledCards: gameCards.shuffled())

    var flippedCards: [UIButton] = []
    var isAbleToPlay: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var button0Outlet: UIButton!
    @IBOutlet weak var button1Outlet: UIButton!
    @IBOutlet weak var button2Outlet: UIButton!
    @IBOutlet weak var button3Outlet: UIButton!
    @IBOutlet weak var button4Outlet: UIButton!
    @IBOutlet weak var button5Outlet: UIButton!
    @IBOutlet weak var button6Outlet: UIButton!
    @IBOutlet weak var button7Outlet: UIButton!
    @IBOutlet weak var button8Outlet: UIButton!
    @IBOutlet weak var button9Outlet: UIButton!

    @IBAction func onRestartPress(_ sender: Any) {
        restartGame()
    }

    @IBAction func onButton0Touch(_ sender: Any) {
        let card = currentGame.cards[0]
        attempt(cardName: card, button: button0Outlet)
    }
    
    @IBAction func onButton1Touch(_ sender: Any) {
        let card = currentGame.cards[1]
        attempt(cardName: card, button: button1Outlet)
    }
    
    @IBAction func onButton2Touch(_ sender: Any) {
        let card = currentGame.cards[2]
        attempt(cardName: card, button: button2Outlet)
    }
    
    @IBAction func onButton3Touch(_ sender: Any) {
        let card = currentGame.cards[3]
        attempt(cardName: card, button: button3Outlet)
    }
    
    @IBAction func onButton4Touch(_ sender: Any) {
        let card = currentGame.cards[4]
        attempt(cardName: card, button: button4Outlet)
    }
    
    @IBAction func onButton5Touch(_ sender: Any) {
        let card = currentGame.cards[5]
        attempt(cardName: card, button: button5Outlet)
    }
    
    @IBAction func onButton6Touch(_ sender: Any) {
        let card = currentGame.cards[6]
        attempt(cardName: card, button: button6Outlet)
    }
    
    @IBAction func onButton7Touch(_ sender: Any) {
        let card = currentGame.cards[7]
        attempt(cardName: card, button: button7Outlet)
    }
    
    @IBAction func onButton8Touch(_ sender: Any) {
        let card = currentGame.cards[8]
        attempt(cardName: card, button: button8Outlet)
    }
    
    @IBAction func onButton9Touch(_ sender: Any) {
        let card = currentGame.cards[9]
        attempt(cardName: card, button: button9Outlet)
    }
}

