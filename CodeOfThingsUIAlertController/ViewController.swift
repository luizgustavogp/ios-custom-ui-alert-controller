//
//  ViewController.swift
//  CodeOfThingsUIAlertController
//
//  Created by Luiz Guimarães on 27/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet private weak var showAlertButton: UIButton! {
        didSet {
            showAlertButton.setTitle("Show Alert", for: .normal)
        }
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let customUIAlertController = CustomUIAlertController(title: "Lorem ipsum dolor sit amet", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet justo eu massa elementum, eu pellentesque lacus iaculis. Suspendisse sit amet est feugiat, fringilla magna ut, facilisis tortor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.")
        
        customUIAlertController.addAction(CustomUIAlertAction(title: "cancel", handler: {
            NSLog("The \"cancel\" alert occured.")
        }))
        
        customUIAlertController.addAction(CustomUIAlertAction(title: "ok, continue", invertColor: true, handler: {
            NSLog("The \"ok, continue\" alert occured.")
        }))
               
        present(customUIAlertController, animated: true, completion: nil)
    }
}

