//
//  MenuViewController.swift
//  CustomTransitions
//
//  Created by Audrey Li on 4/14/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    let customNavigationAnimationController = FoldingNavigationTransitionController()
    let customInteractionController = CustomInteractionController()
    var isVerticalTransition = false
    var isToViewRight = true
    var isToViewBottom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueString: String = segue.identifier {
            switch segueString {
               
            case "right":
                isVerticalTransition = false
                isToViewBottom = false
                isToViewRight = true
            
            case "left":
                isVerticalTransition = false
                isToViewBottom = false
                isToViewRight = false
                
            case "top":
                isVerticalTransition = true
                isToViewBottom = false
                isToViewRight = false
                
            case "bottom":
                isVerticalTransition = true
                isToViewBottom = true
                isToViewRight = false
            default: break // use default values
            }
        }
    }
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // add custom interaction
    //    customFoldNavigationAnimationController.folds = 2
        customNavigationAnimationController.isToViewRight = isToViewRight
        customNavigationAnimationController.isToViewBottom = isToViewBottom
        customNavigationAnimationController.isVerticalTransition = isVerticalTransition
        customInteractionController.isVerticalTransition = isVerticalTransition
        customInteractionController.isToViewRight = isToViewRight
        customInteractionController.isToViewBottom = isToViewBottom
 
        if operation == .Push {
            customInteractionController.attachToViewController(toVC)
            customNavigationAnimationController.reverse = false
            
          
        } else {
           customNavigationAnimationController.reverse = true

        }
          return customNavigationAnimationController

    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return customInteractionController.transitionInProgress ? customInteractionController : nil
    }
    
    


}
