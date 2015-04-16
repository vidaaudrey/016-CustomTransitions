//
//  StyleKit.swift
//  ViewTransition
//
//  Created by Audrey Li on 4/15/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class StyleKit : NSObject {

    //// Drawing Methods

    public class func drawStarIcon1(#fillColor: UIColor) {
        //// Color Declarations
        let color = UIColor(red: 0.982, green: 0.982, blue: 0.982, alpha: 1.000)
        let fillColor1 = fillColor.colorWithAlphaComponent(0.69)
        let fillColor2 = fillColor1.colorWithAlphaComponent(0.6)
        let fillColor3 = fillColor2.colorWithAlphaComponent(0.5)
        let fillColor4 = fillColor3.colorWithAlphaComponent(0.2)

        //// Polygon 3 Drawing
        var polygon3Path = UIBezierPath()
        polygon3Path.moveToPoint(CGPointMake(60.73, 25))
        polygon3Path.addLineToPoint(CGPointMake(91.5, 42.62))
        polygon3Path.addLineToPoint(CGPointMake(91.5, 77.88))
        polygon3Path.addLineToPoint(CGPointMake(60.73, 95.5))
        polygon3Path.addLineToPoint(CGPointMake(29.97, 77.88))
        polygon3Path.addLineToPoint(CGPointMake(29.97, 42.63))
        polygon3Path.addLineToPoint(CGPointMake(60.73, 25))
        polygon3Path.closePath()
        polygon3Path.lineJoinStyle = kCGLineJoinRound;

        fillColor.setFill()
        polygon3Path.fill()
        fillColor1.setStroke()
        polygon3Path.lineWidth = 5
        polygon3Path.stroke()


        //// Polygon Drawing
        var polygonPath = UIBezierPath()
        polygonPath.moveToPoint(CGPointMake(60, 8))
        polygonPath.addLineToPoint(CGPointMake(105.03, 34))
        polygonPath.addLineToPoint(CGPointMake(105.03, 86))
        polygonPath.addLineToPoint(CGPointMake(60, 112))
        polygonPath.addLineToPoint(CGPointMake(14.97, 86))
        polygonPath.addLineToPoint(CGPointMake(14.97, 34))
        polygonPath.addLineToPoint(CGPointMake(60, 8))
        polygonPath.closePath()
        polygonPath.lineJoinStyle = kCGLineJoinRound;

        fillColor2.setFill()
        polygonPath.fill()
        fillColor1.setStroke()
        polygonPath.lineWidth = 5
        polygonPath.stroke()


        //// Polygon 2 Drawing
        var polygon2Path = UIBezierPath()
        polygon2Path.moveToPoint(CGPointMake(60.23, 16))
        polygon2Path.addLineToPoint(CGPointMake(98.5, 37.88))
        polygon2Path.addLineToPoint(CGPointMake(98.5, 81.62))
        polygon2Path.addLineToPoint(CGPointMake(60.23, 103.5))
        polygon2Path.addLineToPoint(CGPointMake(21.97, 81.62))
        polygon2Path.addLineToPoint(CGPointMake(21.97, 37.88))
        polygon2Path.addLineToPoint(CGPointMake(60.23, 16))
        polygon2Path.closePath()
        polygon2Path.lineJoinStyle = kCGLineJoinRound;

        fillColor3.setFill()
        polygon2Path.fill()
        fillColor1.setStroke()
        polygon2Path.lineWidth = 5
        polygon2Path.stroke()


        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(42.5, 43.5, 34, 34))
        fillColor4.setFill()
        ovalPath.fill()
        color.setStroke()
        ovalPath.lineWidth = 5
        ovalPath.stroke()
    }

    public class func drawStarIcon(#fillColor: UIColor) {
        //// Color Declarations
        let color = UIColor(red: 0.982, green: 0.982, blue: 0.982, alpha: 1.000)
        let fillColor1 = fillColor.colorWithAlphaComponent(0.69)
        let fillColor2 = fillColor1.colorWithAlphaComponent(0.6)
        let fillColor3 = fillColor2.colorWithAlphaComponent(0.5)
        let fillColor4 = fillColor3.colorWithAlphaComponent(0.2)
        let fillColor5 = fillColor4.colorWithAlphaComponent(0.1)

        //// Oval 5 Drawing
        var oval5Path = UIBezierPath(ovalInRect: CGRectMake(8, 9, 104, 104))
        fillColor5.setFill()
        oval5Path.fill()


        //// Oval 4 Drawing
        var oval4Path = UIBezierPath(ovalInRect: CGRectMake(19, 18, 84, 84))
        fillColor4.setFill()
        oval4Path.fill()


        //// Oval 3 Drawing
        var oval3Path = UIBezierPath(ovalInRect: CGRectMake(25, 25, 70, 70))
        fillColor3.setFill()
        oval3Path.fill()


        //// Oval 2 Drawing
        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(33, 33, 55, 55))
        fillColor2.setFill()
        oval2Path.fill()


        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(39, 40, 42, 42))
        fillColor1.setFill()
        ovalPath.fill()


        //// Star Drawing
        var starPath = UIBezierPath()
        starPath.moveToPoint(CGPointMake(60, 34))
        starPath.addLineToPoint(CGPointMake(63.83, 55.17))
        starPath.addLineToPoint(CGPointMake(85, 59))
        starPath.addLineToPoint(CGPointMake(63.83, 62.83))
        starPath.addLineToPoint(CGPointMake(60, 84))
        starPath.addLineToPoint(CGPointMake(56.17, 62.83))
        starPath.addLineToPoint(CGPointMake(35, 59))
        starPath.addLineToPoint(CGPointMake(56.17, 55.17))
        starPath.closePath()
        color.setFill()
        starPath.fill()
    }

    public class func drawStarIcon3(#fillColor: UIColor) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let fillColor1 = fillColor.colorWithAlphaComponent(0.69)
        let fillColor2 = fillColor1.colorWithAlphaComponent(0.6)
        let fillColor3 = fillColor2.colorWithAlphaComponent(0.5)
        let fillColor4 = fillColor3.colorWithAlphaComponent(0.2)

        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(53, 4, 14, 44))
        fillColor1.setFill()
        ovalPath.fill()


        //// Oval 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 60.54, 59.45)
        CGContextRotateCTM(context, 60.43 * CGFloat(M_PI) / 180)

        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(-7.54, -55.45, 14, 44))
        fillColor2.setFill()
        oval2Path.fill()

        CGContextRestoreGState(context)


        //// Oval 3 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 59.76, 60.03)
        CGContextRotateCTM(context, 120 * CGFloat(M_PI) / 180)

        var oval3Path = UIBezierPath(ovalInRect: CGRectMake(-7.54, -55.45, 14, 44))
        fillColor3.setFill()
        oval3Path.fill()

        CGContextRestoreGState(context)


        //// Oval 4 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 60.32, 59.68)
        CGContextRotateCTM(context, 180 * CGFloat(M_PI) / 180)

        var oval4Path = UIBezierPath(ovalInRect: CGRectMake(-7.54, -55.45, 14, 44))
        fillColor4.setFill()
        oval4Path.fill()

        CGContextRestoreGState(context)


        //// Oval 5 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 60.46, 60.55)
        CGContextRotateCTM(context, 240 * CGFloat(M_PI) / 180)

        var oval5Path = UIBezierPath(ovalInRect: CGRectMake(-7.54, -55.45, 14, 44))
        fillColor.setFill()
        oval5Path.fill()

        CGContextRestoreGState(context)


        //// Oval 6 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 60.25, 59.75)
        CGContextRotateCTM(context, -56.78 * CGFloat(M_PI) / 180)

        var oval6Path = UIBezierPath(ovalInRect: CGRectMake(-7.54, -55.45, 14, 44))
        fillColor1.setFill()
        oval6Path.fill()

        CGContextRestoreGState(context)
    }

    public class func drawStarIcon4(#fillColor: UIColor) {
        //// Color Declarations
        let color = UIColor(red: 0.982, green: 0.982, blue: 0.982, alpha: 1.000)
        let fillColor1 = fillColor.colorWithAlphaComponent(0.69)
        let fillColor2 = fillColor1.colorWithAlphaComponent(0.6)
        let fillColor3 = fillColor2.colorWithAlphaComponent(0.5)
        let fillColor4 = fillColor3.colorWithAlphaComponent(0.2)
        let fillColor5 = fillColor4.colorWithAlphaComponent(0.1)

        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(8, 10, 104, 104))
        fillColor5.setFill()
        ovalPath.fill()


        //// Star Drawing
        var starPath = UIBezierPath()
        starPath.moveToPoint(CGPointMake(60, 20))
        starPath.addLineToPoint(CGPointMake(76.97, 43.03))
        starPath.addLineToPoint(CGPointMake(100, 60))
        starPath.addLineToPoint(CGPointMake(76.97, 76.97))
        starPath.addLineToPoint(CGPointMake(60, 100))
        starPath.addLineToPoint(CGPointMake(43.03, 76.97))
        starPath.addLineToPoint(CGPointMake(20, 60))
        starPath.addLineToPoint(CGPointMake(43.03, 43.03))
        starPath.closePath()
        fillColor3.setFill()
        starPath.fill()


        //// Bezier Drawing
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(99, 60))
        bezierPath.addLineToPoint(CGPointMake(60, 60))
        bezierPath.addLineToPoint(CGPointMake(78, 76))
        bezierPath.addLineToPoint(CGPointMake(99, 60))
        bezierPath.closePath()
        fillColor3.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(60, 20))
        bezier2Path.addLineToPoint(CGPointMake(60, 60))
        bezier2Path.addLineToPoint(CGPointMake(77, 43))
        bezier2Path.addLineToPoint(CGPointMake(60, 20))
        bezier2Path.closePath()
        fillColor3.setFill()
        bezier2Path.fill()


        //// Bezier 3 Drawing
        var bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(CGPointMake(60, 60))
        bezier3Path.addLineToPoint(CGPointMake(44, 43))
        bezier3Path.addLineToPoint(CGPointMake(21, 60))
        bezier3Path.addLineToPoint(CGPointMake(60, 60))
        bezier3Path.closePath()
        fillColor3.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        var bezier4Path = UIBezierPath()
        bezier4Path.moveToPoint(CGPointMake(60, 60))
        bezier4Path.addLineToPoint(CGPointMake(43, 77))
        bezier4Path.addLineToPoint(CGPointMake(60, 99))
        bezier4Path.addLineToPoint(CGPointMake(60, 60))
        fillColor3.setFill()
        bezier4Path.fill()


        //// Oval 2 Drawing
        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(55, 55, 10, 10))
        color.setFill()
        oval2Path.fill()
    }

    public class func drawPlus(#fillColor: UIColor) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let color = UIColor(red: 0.982, green: 0.982, blue: 0.982, alpha: 1.000)

        //// Shadow Declarations
        let shadow = UIColor.blackColor().colorWithAlphaComponent(0.29)
        let shadowOffset = CGSizeMake(3.1, 3.1)
        let shadowBlurRadius: CGFloat = 5

        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(10, 10, 100, 100))
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, (shadow as UIColor).CGColor)
        fillColor.setFill()
        ovalPath.fill()
        CGContextRestoreGState(context)



        //// Bezier Drawing
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(61.67, 32))
        bezierPath.addCurveToPoint(CGPointMake(61.67, 57.67), controlPoint1: CGPointMake(61.67, 32), controlPoint2: CGPointMake(61.67, 44.12))
        bezierPath.addLineToPoint(CGPointMake(88, 57.67))
        bezierPath.addLineToPoint(CGPointMake(88, 62.33))
        bezierPath.addLineToPoint(CGPointMake(61.67, 62.33))
        bezierPath.addCurveToPoint(CGPointMake(61.67, 88), controlPoint1: CGPointMake(61.67, 75.88), controlPoint2: CGPointMake(61.67, 88))
        bezierPath.addLineToPoint(CGPointMake(57, 88))
        bezierPath.addCurveToPoint(CGPointMake(57, 62.33), controlPoint1: CGPointMake(57, 88), controlPoint2: CGPointMake(57, 75.88))
        bezierPath.addLineToPoint(CGPointMake(32, 62.33))
        bezierPath.addLineToPoint(CGPointMake(32, 57.67))
        bezierPath.addLineToPoint(CGPointMake(57, 57.67))
        bezierPath.addCurveToPoint(CGPointMake(57, 32), controlPoint1: CGPointMake(57, 44.12), controlPoint2: CGPointMake(57, 32))
        bezierPath.addLineToPoint(CGPointMake(60.67, 32))
        bezierPath.addLineToPoint(CGPointMake(61.67, 32))
        bezierPath.closePath()
        color.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        var bezier2Path = UIBezierPath()
        color.setFill()
        bezier2Path.fill()
    }

}

@objc protocol StyleKitSettableImage {
    func setImage(image: UIImage!)
}

@objc protocol StyleKitSettableSelectedImage {
    func setSelectedImage(image: UIImage!)
}
