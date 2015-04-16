//
//  CustomPresentAnimationController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/14/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 5
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        // try later to use viewForKey??
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        let bounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, -bounds.size.height)  // why?
        containerView.addSubview(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .CurveEaseIn, animations: { () -> Void in
            fromViewController.view.alpha = 0.1
            toViewController.view.frame = finalFrameForVC
        }) { (finished) -> Void in
            transitionContext.completeTransition(true)
            fromViewController.view.alpha = 1.0
        }
        
        

    }
    
    
}
