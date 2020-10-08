//
//  ViewController.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 06/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    var indice: Int = 1
    
    @IBAction func onRestartButtonPress(_ sender: Any) {
        indice += 1
        
        UIView.transition(
            with: characterImageView,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.characterImageView.image = UIImage(named: "bonecao_fase_\(self.indice)")
            },
            completion: nil)
        
        if indice == 5 {
            indice = 0
        }
     }
    
    @IBAction func onEditingDone(_ sender: Any) {
        dispatchKeyboard()
    }
}

