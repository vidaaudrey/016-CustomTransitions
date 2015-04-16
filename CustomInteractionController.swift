//
//  CustomInteractionController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/14/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class CustomInteractionController: UIPercentDrivenInteractiveTransition {
    var navigationController: UINavigationController!
    var transitionInProgress = false
    var shouldCompleteTransition = false
    
    var isVerticalTransition  = false
    var isToViewRight = true //
    var isToViewBottom = false  // -> to do use it to optimize reverse animation
    
    var completionSee: CGFloat {
        return 1 - percentComplete
    }
    
    func attachToViewController(viewController: UIViewController) {
        navigationController = viewController.navigationController
        setupGestureRecognizer(viewController.view)
    }
    private func setupGestureRecognizer(view: UIView){
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "handlePan:"))
    }
    
    func handlePan(sender: UIPanGestureRecognizer) {
        let viewTranslation = sender.translationInView(sender.view!.superview!)
        switch sender.state {
        case .Began:
            transitionInProgress = true
            navigationController.popViewControllerAnimated(true)
        case .Changed:
            var const: CGFloat = isVerticalTransition ? CGFloat(fminf(fmaxf(Float(viewTranslation.y / (sender.view!.superview!.bounds.height / 2 )), 0), 1)) :  CGFloat(fminf(fmaxf(Float(viewTranslation.x / (sender.view!.superview!.bounds.width / 2 )), 0), 1))
            shouldCompleteTransition = const > 0.5
            updateInteractiveTransition(const)
        case .Cancelled, .Ended:
            transitionInProgress = false
            if !shouldCompleteTransition || sender.state == .Cancelled {
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
        default:
            break
        }
        
    }
}
