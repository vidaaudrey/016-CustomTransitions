//
//  StarIconView.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/31/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

@IBDesignable
class PlusButtonView: UIButton {
    @IBInspectable var color: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        StyleKit.drawPlus(fillColor: color)
    }
    
}

@IBDesignable
class StarIconView: UIButton {
    @IBInspectable var color: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    override func drawRect(rect: CGRect) {
        StyleKit.drawStarIcon(fillColor: color)
    }
    
}

@IBDesignable
class StarIconView1: UIButton {
    @IBInspectable var color: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    override func drawRect(rect: CGRect) {
        StyleKit.drawStarIcon1(fillColor: color)
    }
    
}

@IBDesignable
class StarIconView4: UIButton {
    @IBInspectable var color: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    override func drawRect(rect: CGRect) {
        StyleKit.drawStarIcon4(fillColor: color)
    }
    
}

@IBDesignable
class StarIconView3: UIButton {
    @IBInspectable var color: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    override func drawRect(rect: CGRect) {
        StyleKit.drawStarIcon3(fillColor: color)
    }
    
}


