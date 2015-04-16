//
//  CustomNavigationAnimationController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/14/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

// 3D Matrix
//[X][0][0][0]
//[0][Y][0][0]
//[0][0][Z][0]
//[0][0][0][1]

// when change direction in the same orientation , only anchor point change, the other data does not change

// use CGAffineTransform for container view transform. use CATransform3D for subviews' transform. 
class CustomNavigationAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    var reverse = false
    
    var isToViewRight = false
    var isToViewBottom = true
    var isVerticalTransition = true
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 3.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toView = toViewController.view
        let fromView = fromViewController.view
        let const: CGFloat = -0.005
        var viewFromTransform: CATransform3D
        var viewToTransform: CATransform3D
        var direction: CGFloat = 1  // initalize just to avoid error, but value will update
        var anchorDirection: CGFloat
        
        if !isVerticalTransition {
        
            direction = (reverse ? -1 : 1) * (isToViewRight ? 1 : -1)
            anchorDirection = (reverse ? -1 : 1) * (isToViewRight ? 1 : -1)
            
            fromView.layer.anchorPoint = CGPointMake(anchorDirection == 1 ? 1 : 0, 0.5)
            toView.layer.anchorPoint = CGPointMake(anchorDirection == 1 ? 0 : 1, 0.5)
            
            viewFromTransform = CATransform3DMakeRotation(direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
            viewToTransform = CATransform3DMakeRotation(-direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
            containerView.transform = CGAffineTransformMakeTranslation(direction * containerView.frame.size.width / 2.0, 0)
        
        } else {
            // vertical transition config
            direction = (reverse ? -1 : 1) * (isToViewBottom ? 1 : -1)
            anchorDirection = (reverse ? -1 : 1) * (isToViewBottom ? 1 : -1)
            
            fromView.layer.anchorPoint = CGPointMake(0.5, anchorDirection == 1 ? 1 : 0)
            toView.layer.anchorPoint = CGPointMake(0.5, anchorDirection == 1 ? 0 : 1)
            
            viewFromTransform = CATransform3DMakeRotation(-direction * CGFloat(M_PI_2), 1.0, 0.0, 0.0)
            viewToTransform = CATransform3DMakeRotation(direction * CGFloat(M_PI_2), 1.0, 0.0, 0.0)
            containerView.transform = CGAffineTransformMakeTranslation(0, direction * containerView.frame.size.height / 2.0)
        }
        
        
        viewFromTransform.m34 = const
        viewToTransform.m34 = const
        toView.layer.transform = viewToTransform
        containerView.addSubview(toView)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            if !self.isVerticalTransition {
                containerView.transform = CGAffineTransformMakeTranslation(-direction * containerView.frame.size.width / 2.0, 0)
            } else {
                containerView.transform = CGAffineTransformMakeTranslation(0, -direction * containerView.frame.size.height / 2.0)
            }
            
            fromView.layer.transform = viewFromTransform
            toView.layer.transform = CATransform3DIdentity
            }, completion: {
                finished in
                containerView.transform = CGAffineTransformIdentity
                fromView.layer.transform = CATransform3DIdentity
                toView.layer.transform = CATransform3DIdentity
                fromView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                toView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                
                if (transitionContext.transitionWasCancelled()) {
                    toView.removeFromSuperview()
                } else {
                    fromView.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })        
    }
}
