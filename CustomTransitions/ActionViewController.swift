//
//  ActionViewController.swift
//  CustomTransitions
//
//  Created by Joyce Echessa on 3/2/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    @IBOutlet weak var btnView: UIButton!

    @IBAction func dismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
