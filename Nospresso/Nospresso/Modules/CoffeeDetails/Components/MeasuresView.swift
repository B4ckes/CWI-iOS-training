//
//  MeasuresView.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import UIKit

class MeasureView: UIView {
    class func doNib() -> MeasureView {
        R.nib.measuresView.firstView(owner: nil)!
    }
    
    @IBOutlet private weak var cupImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func config(with measure: Coffee.Measure) {
        
    }
}
