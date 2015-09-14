//
//  PushButtonView.swift
//  CountDrink
//
//  Created by Tran Duc Hieu on 9/14/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

@IBDesignable // Open up Live Rendering

class PushButtonView: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect) // Create an oval-shaped
        fillColor.setFill()
        path.fill()
        
        // Set up the width and the height variables for the horizontal stroke
        // The width of stroke is 60% min of the bound's width and height
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        // Create the path
        let plusPath = UIBezierPath()
        
        // Set the path's line width to height of the stroke
        plusPath.lineWidth = plusHeight
        
        // Move the initial point of the path to the start of the horizontal Stroke
        plusPath.moveToPoint(CGPoint(x: bounds.width/2-plusWidth/2+0.5, y: bounds.height/2+0.5))
        
        // Add a point to the path at the end of the horizontal Stroke
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2+plusWidth/2+0.5, y: bounds.height/2+0.5))
        
        if isAddButton {
            // Move the initial point of the path to the start of the vertical Stroke
            plusPath.moveToPoint(CGPoint(x: bounds.width/2+0.5, y: bounds.height/2-plusWidth/2+0.5))
            
            // Add a point to the path at the end of the vertical Stroke
            plusPath.addLineToPoint(CGPoint(x: bounds.width/2+0.5, y: bounds.height/2+plusWidth/2+0.5))
        }
        
        // Set the Stroke color
        UIColor.whiteColor().setStroke()
        
        // Draw the Stroke
        plusPath.stroke()
    }
    
}
