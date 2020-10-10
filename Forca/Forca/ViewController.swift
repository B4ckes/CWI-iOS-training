//
//  ViewController.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var game: ForcaGame = ForcaGame.random()
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var maskedWordlabel: UILabel!
    @IBOutlet weak var letterTextField: UITextField!
    @IBOutlet weak var attemptHistoryLabel: UILabel!
    
    @IBAction func onRestartButtonPress(_ sender: Any) {
        newGame()
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
    private func attemptHistoryFormatter() -> NSAttributedString {
        game.attemptHistory.reduce(NSMutableAttributedString()) { (text, char) in
            if game.word.contains(char) {
                text.append(char.greenColor)
            } else {
                text.append(char.redColor)
            }
            
            return text
        }.spaced
    }

    private func refreshScreen() {
        hintLabel.text = "A dica é: \(game.hint)"
        maskedWordlabel.attributedText = game.maskedWord.spaced
        attemptHistoryLabel.attributedText = attemptHistoryFormatter()
        letterTextField.text = ""
        refreshImage()
        
        if game.hasLost {
            warnLoser()
        } else if game.hasWinned {
            warnWinner()
        }
    }
    
    private func newGame() {
        game = ForcaGame.random()
        refreshScreen()
    }
    
    var action: UIAlertAction {UIAlertAction(title: "Jogar novamente", style: .default) { _ in
        self.newGame()
    }}
    
    private func warnLoser() {
        let alert = UIAlertController(
            title: "Que pena, você errou",
            message: "Pensa um pouco mais da próxima vez",
            preferredStyle: .alert)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func warnWinner() {
        let alert = UIAlertController(
            title: "Ma ôe!",
            message: "Você acertou, parabéns!",
            preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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

let words = [
    "abelha": "inseto",
    "formiga": "inseto",
    "macaco": "animal",
    "cabra": "animal",
]

extension ForcaGame {
    class func random() -> ForcaGame {
        guard let item = words.randomElement() else {
            return ForcaGame(word: "Desnatado", hint: "Microfone")
        }
        
        return ForcaGame(word: item.key, hint: item.value)
    }
}
