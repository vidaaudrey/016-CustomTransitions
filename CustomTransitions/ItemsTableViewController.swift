//
//  ItemsTableViewController.swift
//  CustomTransitions
//
//  Created by Joyce Echessa on 3/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController, UIViewControllerTransitioningDelegate , UINavigationControllerDelegate{

    let customPresentAnimationController = CustomPresentAnimationController()
    let customDismissAnimationController = CustomDismissAnimationController()
    let customNavigationAnimationController = CustomNavigationAnimationController()
    let customFoldNavigationAnimationController = FoldNavigationAnimationController()
    let customInteractionController = CustomInteractionController()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAction" {
            if let toViewController = segue.destinationViewController as? UIViewController {
                toViewController.transitioningDelegate = self
            }
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissAnimationController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // add custom interaction 
        if operation == .Push {
            customInteractionController.attachToViewController(toVC)
        }
        
        // The direction of the transition is based on whether this is a push or pop navigation operation.
//        customNavigationAnimationController.reverse = operation == UINavigationControllerOperation.Pop
//        customNavigationAnimationController.folds = 3
//        return customNavigationAnimationController
        if operation == .Push {
            customNavigationAnimationController.reverse = false
            return customNavigationAnimationController
        } else {
            customFoldNavigationAnimationController.reverse = true
            customFoldNavigationAnimationController.folds = 2
            return customFoldNavigationAnimationController
        }
    }

    //for custom interaction 
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return customInteractionController.transitionInProgress ? customInteractionController : nil
    }
    
    
    
    // not related
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "Item 0\(indexPath.row + 1)"
        return cell
    }

}
