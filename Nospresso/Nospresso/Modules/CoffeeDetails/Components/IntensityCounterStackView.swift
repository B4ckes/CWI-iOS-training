//
//  IntensityCounterStackView.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 20/10/20.
//

import UIKit

class IntensityCounterStackView: UIStackView {
    let ballSize: CGFloat = 7
    let maxIntensity: Int = 13
    
    func generateBall(shouldFill: Bool) -> UIView {
        let ball = UIView()
        
        NSLayoutConstraint.activate([
            ball.widthAnchor.constraint(equalToConstant: ballSize),
            ball.heightAnchor.constraint(equalToConstant: ballSize)
        ])
        
        ball.layer.cornerRadius = ballSize / 2
        ball.layer.borderWidth = 0.4

        ball.layer.borderColor = (shouldFill ? UIColor.black : Colors.borderEmptyIntensity())?.cgColor
        ball.backgroundColor = shouldFill ? Colors.filledIntensity() : Colors.emptyIntensity()
        
        return ball
    }
    
    func config(for intensity: Int) {
        let emptyBallsQuantity = maxIntensity - intensity
        
        for _ in 0..<intensity {
            let ball = generateBall(shouldFill: true)

            addArrangedSubview(ball)
        }
        
        for _ in 0..<emptyBallsQuantity {
            let ball = generateBall(shouldFill: false)

            addArrangedSubview(ball)
        }
        
        addArrangedSubview(UIView())
    }
}
