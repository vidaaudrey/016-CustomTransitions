//
//  FoldingNavigationTransitionController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/15/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class FoldingNavigationTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    var reverse = false
    var folds = 2
    
    var isToViewRight = false
    var isToViewBottom = true
    var isVerticalTransition = true
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let toView = toViewController.view
        let fromView = fromViewController.view
        let size = toView.frame.size
        let const: CGFloat = -0.005
        var viewFromTransform: CATransform3D
        var viewToTransform: CATransform3D
        var direction: CGFloat = 1  // initalize just to avoid error, but value will update
        var anchorDirection: CGFloat
        
        
        if !reverse {
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
            
           ///////////////////////do the folding when dismiss Child view /////////////
        } else {
            direction = (reverse ? -1 : 1) * (isToViewRight ? 1 : -1)
            var verticalDirection: CGFloat = (reverse ? -1 : 1) * (isToViewBottom ? 1 : -1)
            
            fromView.alpha = 0
            let snapshotView = fromView.snapshotViewAfterScreenUpdates(false)
            
            let layoutResults = layoutFoldViews(snapshotView, containerView: containerView)
            let foldViews:[UIView] = layoutResults.0
            containerView = layoutResults.1
            
            toView.frame = isVerticalTransition ? CGRectOffset(toView.frame,0, verticalDirection*toView.frame.height) : CGRectOffset(toView.frame, direction*toView.frame.width, 0)
            containerView.addSubview(toView)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                
                toView.frame = finalFrameForVC  // back to original place
                
                
                if self.isVerticalTransition {
                    
                    for var i = 0; i < foldViews.count - 1; i++ {
                        var upViewTransform = CATransform3DMakeRotation(-CGFloat(M_PI_2), 1, 0, 0)
                        let upViewPosition = CGPointMake(size.width / 2,  self.isToViewBottom ? size.height : 0)
                        foldViews[i].layer.position = upViewPosition
                        upViewTransform.m34 = const
                        foldViews[i].layer.transform = upViewTransform
                        foldViews[i].layer.opacity = 0.4
                        
                        i++
                        
                        var downViewTransform = CATransform3DMakeRotation(CGFloat(M_PI_2), 1, 0, 0)
                        let downViewPosition = CGPointMake(size.width / 2,  self.isToViewBottom ? size.height : 0)
                        foldViews[i].layer.position = downViewPosition
                        downViewTransform.m34 = const
                        foldViews[i].layer.transform = downViewTransform
                        foldViews[i].layer.opacity = 0.1
                    }
                    
                } else {
                    for var i = 0; i < foldViews.count - 1; i++ {
                        var leftViewTransform = CATransform3DMakeRotation(-CGFloat(M_PI_2), 0, 1, 0)
                        let leftViewPosition = CGPointMake(self.isToViewRight ? size.width : 0, size.height / 2)
                        foldViews[i].layer.position = leftViewPosition
                        leftViewTransform.m34 = const
                        foldViews[i].layer.transform = leftViewTransform
                        foldViews[i].layer.opacity = 0.4
                        
                        i++
                        
                        var rightViewTransform = CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 1, 0)
                        let rightViewPosition = CGPointMake(self.isToViewRight ? size.width : 0, size.height / 2)
                        foldViews[i].layer.position = rightViewPosition
                        rightViewTransform.m34 = const
                        foldViews[i].layer.transform = rightViewTransform
                        foldViews[i].layer.opacity = 0.1
                    }
                }

            
                }) { (finished) -> Void in
                    containerView.transform = CGAffineTransformIdentity
                    
                    toView.layer.transform = CATransform3DIdentity
                    toView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                    
                    for foldView in foldViews {
                        foldView.removeFromSuperview()
                    }
                    for var i = 0; i < foldViews.count; i++ {
                        foldViews[i].removeFromSuperview()
                    }
                    
                    if transitionContext.transitionWasCancelled() {
                        toView.removeFromSuperview()
                        fromView.alpha = 1
                    } else {
                        fromView.removeFromSuperview()
                    }
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
            }
            
        }
    }
    
    private func layoutFoldViews(snapshotView: UIView, containerView: UIView) -> (foldViews:[UIView], containerView: UIView){
        
        var foldViews = [UIView]()
        var offset: CGFloat = 0
    
        if isVerticalTransition {
            
            let foldWidth = snapshotView.bounds.width
            let foldHeight = snapshotView.bounds.height / CGFloat(folds * 2)
            
            for var i = 0; i < folds; i++ {
                let upViewFrame = CGRectMake(0, offset, foldWidth, foldHeight)
                let upSnapshotView = snapshotView.resizableSnapshotViewFromRect(upViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
                upSnapshotView.layer.anchorPoint = CGPointMake(0.5, 0)
                upSnapshotView.layer.position = CGPointMake(foldWidth / 2, offset)
                containerView.addSubview(upSnapshotView)
                foldViews.append(upSnapshotView)
                offset += foldHeight
                
                let downViewFrame = CGRectMake(0, offset, foldWidth, foldHeight)
                let downSnapshotView = snapshotView.resizableSnapshotViewFromRect(downViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
                downSnapshotView.layer.anchorPoint = CGPointMake(0.5, 1)
                downSnapshotView.layer.position = CGPointMake(foldWidth / 2, offset + foldHeight)
                containerView.addSubview(downSnapshotView)
                
                foldViews.append(downSnapshotView)
                offset +=  foldHeight
            }
            
        } else {
            
            let foldWidth = snapshotView.bounds.width / CGFloat(folds * 2)
            let foldHeight = snapshotView.bounds.height
            
            
            for var i = 0; i < folds; i++ {
                let leftViewFrame = CGRectMake(offset, 0, foldWidth, foldHeight)
                let leftSnapshotView = snapshotView.resizableSnapshotViewFromRect(leftViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
                leftSnapshotView.layer.anchorPoint = CGPointMake(0, 0.5)
                leftSnapshotView.layer.position = CGPointMake(offset, foldHeight / 2) // must get the position right
                containerView.addSubview(leftSnapshotView)
                foldViews.append(leftSnapshotView)
                offset +=  foldWidth
                
                let rightViewFrame = CGRectMake(offset, 0, foldWidth, foldHeight)
                let rightSnapshotView = snapshotView.resizableSnapshotViewFromRect(rightViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
                rightSnapshotView.layer.anchorPoint = CGPointMake(1, 0.5)
                rightSnapshotView.layer.position = CGPointMake(offset + foldWidth, foldHeight / 2)
                containerView.addSubview(rightSnapshotView)
                
                foldViews.append(rightSnapshotView)
                offset +=  foldWidth

            }
        }

        
        return(foldViews, containerView)
    }

}
