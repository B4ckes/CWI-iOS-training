//
//  ViewController.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var game: ForcaGame = ForcaGame(word: "DESNATADO", hint: "Emilio")
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var maskedWordlabel: UILabel!
    @IBOutlet weak var letterTextField: UITextField!
    @IBOutlet weak var attemptHistoryLabel: UILabel!
    
    @IBAction func onRestartButtonPress(_ sender: Any) {
        // Restart game
     }
    
    @IBAction func onEditingDone(_ sender: Any) {
        if let text = letterTextField.text {
            game.attempt(char: text)
            refreshScreen()
        }
    }
    
    @IBAction func onTextChange(_ sender: Any) {
        letterTextField.text = letterTextField.text?.last?.uppercased()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshScreen()
    }
}

extension ViewController {
    private func refreshScreen() {
        hintLabel.text = "A dica é: \(game.hint)"
        maskedWordlabel.attributedText = game.maskedWord.spaced
        attemptHistoryLabel.attributedText = game.attemptHistory.joined().spaced
        refreshImage()
    }
    
    private func refreshImage() {
        let image: UIImage?
        
        if game.hasLost {
            image = UIImage(named: "bonecao_completo_e_mortinho")
        } else if game.missedAttempts == 0 {
            image = nil
        } else {
            image = UIImage(named: "bonecao_fase_\(game.missedAttempts)")
        }
        
        
        
        UIView.transition(
            with: characterImageView,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.characterImageView.image = image
            },
            completion: nil)
    }
}
