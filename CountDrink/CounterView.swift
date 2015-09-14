//
//  CounterView.swift
//  CountDrink
//
//  Created by Tran Duc Hieu on 9/14/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

let NumberOfGlasses = 8 // target number of glasses to drink per day
let pi: CGFloat = CGFloat(M_PI) 

// Open up Live Rendering class

@IBDesignable class CounterView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // keeps track of the number of glasses consumed
    @IBInspectable var counter:Int = 5 {
        didSet {
            if counter <= NumberOfGlasses {
                // Refresh the view
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        // Define the center point of the view where you’ll rotate the arc around.
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        // Calculate the radius based on the max dimension of the view.
        let radius:CGFloat = max(bounds.width, bounds.height)
        
        // Define the thickness of the arc.
        let arcWidth:CGFloat = 76
        
        // Define the start and end angles for the arc.
        let startAngle:CGFloat = 3 * pi / 4
        let endAngle:CGFloat = pi / 4
        
        // Create a path based on the center point, radius, and angles you just defined.
        // let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2-arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // Set the line width and color before finally stroking the path.
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // Draw the outline
        
        // Calculate the difference between the two angles, ensure it is positive
        let angleDifference:CGFloat = 2*pi - startAngle + endAngle
        
        // Calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(NumberOfGlasses)
        
        // Multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
  
        let lineWidth:CGFloat = 5.0
        
        var halfLineWidth = lineWidth / 2
        
        if counter == 0 {
            halfLineWidth = 0
        }
        
        // Draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - halfLineWidth, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        // Draw the inner arc
        outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth + halfLineWidth, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
            
        // Close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = lineWidth
        outlinePath.stroke()
    }
}
