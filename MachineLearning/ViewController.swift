//
//  ViewController.swift
//  MachineLearning
//
//  Created by Tamara Erlij on 19/10/19.
//  Copyright © 2019 Tamara Erlij. All rights reserved.
//

import UIKit
 import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
   
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
    }
    
}

