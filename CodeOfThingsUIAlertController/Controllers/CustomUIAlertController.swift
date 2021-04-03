//
//  CustomUIAlertController.swift
//  CodeOfThingsUIAlertController
//
//  Created by Luiz Guimarães on 27/03/21.
//

import UIKit

class CustomUIAlertController: CustomViewController<CustomUIAlertView>, CustomUIAlertControllerProtocol {
    
    private(set) var message: String?
    private(set) var actions: [CustomUIAlertAction]
    
    init(title: String, message: String) {
        self.message = message
        self.actions = [CustomUIAlertAction]()
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
        self.modalPresentationStyle = .overFullScreen
        
        customView.delegate = self
        customView.configure(title: title, message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    func addAction(_ customUIAlertAction: CustomUIAlertAction) {
        actions.append(customUIAlertAction)
        customView.addActionButton(customUIAlertAction: customUIAlertAction)
    }
}

extension CustomUIAlertController: CustomUIAlertViewDelegate {
    func close() {
        dismiss(animated: true, completion: nil)
    }
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
