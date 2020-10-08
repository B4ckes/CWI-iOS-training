//
//  ViewController.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var game: ForcaGame = ForcaGame(word: "DESNATADO", hint: "Emilio")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var maskedWordlabel: UILabel!
    @IBOutlet weak var letterTextField: UITextField!
    @IBOutlet weak var attemptHistoryLabel: UILabel!
    
    
    var indice: Int = 1
    
    @IBAction func onRestartButtonPress(_ sender: Any) {
        indice += 1
        
        if indice == 5 {
            indice = 0
        }
     }
    
    @IBAction func onEditingDone(_ sender: Any) {
//        if let text = letterTextField.text, let actualHints = letterHistoryLabel.attributedText {
//            var actualText = NSMutableAttributedString(attributedString: actualHints)
//            actualText.append(text.spaced)
//
//            letterHistoryLabel.attributedText = actualText
//        }
        
        if let text = letterTextField.text {
            game.attempt(char: text)
            refreshImage()
            refreshScreen()
        }
    }
    
    @IBAction func onTextChange(_ sender: Any) {
        letterTextField.text = letterTextField.text?.last?.uppercased()
    }
}

extension ViewController {
    private func refreshScreen() {
        hintLabel.text = "A dica é: \(game.hint)"
        maskedWordlabel.attributedText = game.maskedWord.spaced
        attemptHistoryLabel.attributedText = game.attemptHistory.joined().spaced
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
