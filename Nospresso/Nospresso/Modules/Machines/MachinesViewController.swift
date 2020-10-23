//
//  MachinesViewController.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import UIKit

class MachinesViewController: UIViewController {
    
    typealias Presenter = MachinesPresenter & UICollectionViewDataSource
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    lazy var presenter: Presenter = MachinesPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Máquinas"
        
        removeTextFromBackButton()
        
        collectionView.delegate = self
        collectionView.dataSource = self.presenter
        collectionView.register(R.nib.machineCollectionViewCell)
        collectionView.backgroundColor = UIColor(resource: Colors.grayBackground)
        presenter.screenLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = Colors.machines()
        navigationController?.navigationBar.tintColor = .white
        
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
}

extension MachinesViewController: MachinesViewType {
    func refreshCollection() {
        collectionView.reloadData()
    }
}

extension MachinesViewController: UICollectionViewDelegateFlowLayout {
    enum layoutConstant {
        static let cellHeight = 280
        static let cellWidth = 179
        static let spaceBetween = 15
        static let containerPadding = 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: layoutConstant.cellWidth, height: layoutConstant.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(layoutConstant.spaceBetween)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(layoutConstant.spaceBetween)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: CGFloat(layoutConstant.containerPadding), left: CGFloat(layoutConstant.containerPadding), bottom: CGFloat(layoutConstant.containerPadding), right: CGFloat(layoutConstant.containerPadding))
    }
}
