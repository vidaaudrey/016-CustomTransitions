//
//  FlexFoldNavigationTransitionController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/14/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

enum Direction: Int{
    case Top = 0
    case Right = 1
    case Bottom = 2
    case Left = 3
}

class FlexFoldNavigationTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    var reverse: Bool = false
    var folds: Int = 1
    var direction = Direction.Right
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        
        let toView = toViewController.view
        let fromView = fromViewController.view
        fromView.alpha = 0 
        let const: CGFloat = -0.005
        let size = toView.frame.size

        let snapshotView = fromView.snapshotViewAfterScreenUpdates(false) // create before the update
        let layoutResults = layoutFoldViews(snapshotView, containerView: containerView)
        let foldViews:[UIView] = layoutResults.0
        let shadowViews:[UIView] = layoutResults.1
        containerView = layoutResults.2
        
        var direction: CGFloat = reverse ? -1 : 1
        
        if !reverse {
            toView.frame = CGRectOffset(toView.frame, direction * toView.frame.width, 0)  //-> check later for reverse
            containerView.addSubview(toView)
            
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                
                toView.frame = finalFrameForVC
                
                for var i = 0; i < foldViews.count - 1; i++ {
                    var leftViewTransform = CATransform3DMakeRotation(-CGFloat(M_PI_2), 0, 1, 0)
                    let leftViewPosition = CGPointMake(self.reverse ? size.width : 0, size.height / 2)
                    foldViews[i].layer.position = leftViewPosition
                    leftViewTransform.m34 = const
                    foldViews[i].layer.transform = leftViewTransform
                    foldViews[i].layer.opacity = 0.6
                    
                    shadowViews[i].layer.opacity = 1
                    shadowViews[i].layer.position = leftViewPosition
                    shadowViews[i].layer.transform = leftViewTransform
                    
                    i++
                    
                    var rightViewTransform = CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 1, 0)
                    let rightViewPosition = CGPointMake(self.reverse ? size.width : 0, size.height / 2)
                    foldViews[i].layer.position = rightViewPosition
                    rightViewTransform.m34 = const
                    foldViews[i].layer.transform = rightViewTransform
                    foldViews[i].layer.opacity = 0.7
                    
                    shadowViews[i].layer.opacity = 0.6
                    shadowViews[i].layer.position = rightViewPosition
                    shadowViews[i].layer.transform = rightViewTransform
                    
                }
                
                }) { (finished) -> Void in

                    toView.layer.transform = CATransform3DIdentity
                    toView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                    fromView.alpha = 1
         
                    for var i = 0; i < foldViews.count; i++ {
                        shadowViews[i].removeFromSuperview()
                        foldViews[i].removeFromSuperview()
                    }
                    
                    if transitionContext.transitionWasCancelled() {
                        toView.removeFromSuperview()
                        fromView.alpha = 1
                    } else {
                       // fromView.removeFromSuperview()  -->
                    }
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
            }
        } else {
            // do the unfolding animation
            toView.frame = CGRectOffset(toView.frame, direction * toView.frame.width, 0)  //-> check later for reverse
            containerView.addSubview(toView)
            
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                
                toView.frame = finalFrameForVC
                
                for var i = 0; i < foldViews.count - 1; i++ {
                    var leftViewTransform = CATransform3DMakeRotation(-CGFloat(M_PI_2), 0, 1, 0)
                    let leftViewPosition = CGPointMake(self.reverse ? size.width : 0, size.height / 2)
                    foldViews[i].layer.position = leftViewPosition
                    leftViewTransform.m34 = const
                    foldViews[i].layer.transform = leftViewTransform
                    foldViews[i].layer.opacity = 0.6
                    
                    shadowViews[i].layer.opacity = 1
                    shadowViews[i].layer.position = leftViewPosition
                    shadowViews[i].layer.transform = leftViewTransform
                    
                    i++
                    
                    var rightViewTransform = CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 1, 0)
                    let rightViewPosition = CGPointMake(self.reverse ? size.width : 0, size.height / 2)
                    foldViews[i].layer.position = rightViewPosition
                    rightViewTransform.m34 = const
                    foldViews[i].layer.transform = rightViewTransform
                    foldViews[i].layer.opacity = 0.7
                    
                    shadowViews[i].layer.opacity = 0.6
                    shadowViews[i].layer.position = rightViewPosition
                    shadowViews[i].layer.transform = rightViewTransform
                    
                }
                
                }) { (finished) -> Void in
                    
                    toView.layer.transform = CATransform3DIdentity
                    toView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                    fromView.alpha = 1
                    
                    for var i = 0; i < foldViews.count; i++ {
                        shadowViews[i].removeFromSuperview()
                        foldViews[i].removeFromSuperview()
                    }
                    
                    if transitionContext.transitionWasCancelled() {
                        toView.removeFromSuperview()
                        fromView.alpha = 1
                    } else {
                        // fromView.removeFromSuperview()  -->
                    }
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        }
    }
    
    private func layoutFoldViews(snapshotView: UIView, containerView: UIView) -> (shadowViews:[UIView], foldViews:[UIView], containerView: UIView){
        
        var foldViews = [UIView]()
        var shadowViews = [UIView]()
        var offset: CGFloat = 0
        let foldWidth = snapshotView.bounds.width / CGFloat(folds * 2) - 10
        let foldHeight = snapshotView.bounds.height
        let size = snapshotView.frame.size
        
        for var i = 0; i < folds; i++ {
            let leftViewFrame = CGRectMake(offset, 0, foldWidth, foldHeight)
            let leftSnapshotView = snapshotView.resizableSnapshotViewFromRect(leftViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
            leftSnapshotView.layer.anchorPoint = CGPointMake(0, 0.5)
            leftSnapshotView.layer.position = CGPointMake(offset, foldHeight / 2) // must get the position right
            containerView.addSubview(leftSnapshotView)
            
            // lay the shadow view on top of the fold view so we can animate it's opacity
            let shadowView = getShadowView(leftSnapshotView, reverseFold: true)
            shadowView.layer.anchorPoint = CGPointMake(0, 0.5)
            shadowView.layer.position = CGPointMake(offset, foldHeight / 2)
            shadowView.layer.opacity = 0
            containerView.addSubview(shadowView)
            shadowViews.append(shadowView)
            
            foldViews.append(leftSnapshotView)
            offset += foldWidth
            
            let rightViewFrame = CGRectMake(offset, 0, foldWidth, foldHeight)
            let rightSnapshotView = snapshotView.resizableSnapshotViewFromRect(rightViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
            rightSnapshotView.layer.anchorPoint = CGPointMake(1, 0.5)
            rightSnapshotView.layer.position = CGPointMake(offset + foldWidth, foldHeight / 2)
            containerView.addSubview(rightSnapshotView)
            
            let shadowViewRight = getShadowView(rightSnapshotView, reverseFold: false)
            shadowViewRight.layer.anchorPoint = CGPointMake(1, 0.5)
            shadowViewRight.layer.position = CGPointMake(offset + foldWidth, foldHeight / 2)
            shadowViewRight.layer.opacity = 0
            containerView.addSubview(shadowViewRight)
            shadowViews.append(shadowViewRight)
            
            foldViews.append(rightSnapshotView)
            offset += foldWidth
        }
        
        return(shadowViews, foldViews, containerView)
    }
    private func getShadowView(view: UIView, reverseFold: Bool) -> UIView {
        let shadowView = UIView(frame: view.frame)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 1, green: 1, blue: 1, alpha: 0) ,UIColor.blackColor().CGColor]
        gradientLayer.startPoint = CGPointMake(reverseFold ? 0 : 1, reverseFold ? 0.2 : 0)
        gradientLayer.endPoint = CGPointMake(reverseFold ? 1 : 0, reverseFold ? 0 : 1)
        shadowView.layer.addSublayer(gradientLayer)
        return shadowView
    }
    
    
}
