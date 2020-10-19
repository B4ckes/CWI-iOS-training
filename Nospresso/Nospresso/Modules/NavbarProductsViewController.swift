//
//  NavbarProductsViewController.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 17/10/20.
//

import UIKit

class NavbarProductsViewController: UIViewController {
    override func viewDidLoad() {
        removeTextFromBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
