//
//  CoffeeDetailPresenter.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 20/10/20.
//

import UIKit

class CoffeeDetailsPresenter {
    var view: CoffeeDetailsViewType?
    var coffee: Coffee?
    let API = Api()
}

extension CoffeeDetailsPresenter: CoffeeDetailsPresenterType {
    func screenLoaded() {
        guard let coffee = coffee else { return }
        
        view?.showTitle(coffee.name)
        API.request(
            endpoint: .cafe(id: coffee.id),
            success: { (coffee: Coffee) in
                self.view?.renderData(from: coffee)
            },
            failure: { _ in })
    }
}

extension CoffeeDetailsPresenter {
    class func createModule(with coffee: Coffee) -> UIViewController {
//        Sem R
//        let viewController = UIStoryboard(name: "Main", bundle: .main)
//            .instantiateViewController(identifier: "CoffeeDetailsViewController") as? CoffeeDetailsViewController
        
//      Com R
        let viewController = R.storyboard.main.coffeeDetailsViewController()!
        
        let presenter = CoffeeDetailsPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.coffee = coffee
        
        return viewController
    }
}
