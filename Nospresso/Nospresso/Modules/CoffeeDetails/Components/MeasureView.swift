//
//  MeasuresView.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import UIKit

class MeasureView: UIView {
    class func doNib() -> MeasureView {
        R.nib.measureView.firstView(owner: nil)!
    }
    
    @IBOutlet private weak var cupImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func config(with measure: Coffee.Measure) {
        cupImageView.image = measure.image
        nameLabel.text = measure.rawValue
    }
}

extension Coffee.Measure {
    var image: UIImage? {
        switch self {
        case .ristretto:
            return Images.ic_ristretto()
        case .espresso:
            return Images.ic_espresso()
        case .lungo:
            return Images.ic_lungo()
        }
    }
}
