//
//  NavbarProductsViewController.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 17/10/20.
//

import UIKit

class NavbarProductsViewController: UIViewController {
    @IBOutlet private weak var machinesView: UIView!
    
    @objc
    private func onMachinesTouch(_ sender: Any) {
        let vc = MachinesViewController(nib: R.nib.machinesViewController)

        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeTextFromBackButton()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.onMachinesTouch))
        machinesView.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
