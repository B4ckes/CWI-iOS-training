//
//  MachinesPresenter.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import UIKit

class MachinesPresenter: NSObject {
    var view: MachinesViewType
    var machines: [Machine] = []
    
    let API = Api()
    
    init(view: MachinesViewType) {
        self.view = view
    }
}

extension MachinesPresenter: MachinesPresenterType {
    func screenLoaded() {
        API.request(endpoint: .maquinas) { (machines: [Machine]) in
            self.machines = machines
            DispatchQueue.main.async {
                self.view.refreshCollection()
            }
        } failure: { error in
            print(error)
        }
    }
}

extension MachinesPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { machines.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.machineCell, for: indexPath)!
        let machine = machines[indexPath.item]
        
        cell.config(with: machine)
        
        return cell
    }
    
    
}
