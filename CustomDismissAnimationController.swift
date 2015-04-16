//
//  CustomDismissAnimationController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/14/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        
        toViewController.view.frame = finalFrameForVC
        toViewController.view.alpha = 0.5
        containerView.addSubview(toViewController.view)
        containerView.sendSubviewToBack(toViewController.view) // imp!!
        
        // solve the problem that the photo does not animate
        let snapshotView = fromViewController.view.snapshotViewAfterScreenUpdates(true) // create before the update
        snapshotView.frame = fromViewController.view.frame
        containerView.addSubview(snapshotView)
        fromViewController.view.removeFromSuperview()
        
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
          //  fromViewController.view.frame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width / 2, fromViewController.view.frame.size.height / 2)
            snapshotView.frame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width / 2, fromViewController.view.frame.size.height / 2)
            
            toViewController.view.alpha = 1
        }) { (finished) -> Void in
            snapshotView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
}
