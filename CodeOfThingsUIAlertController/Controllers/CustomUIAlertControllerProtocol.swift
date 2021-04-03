//
//  CustomUIAlertControllerProtocol.swift
//  CodeOfThingsUIAlertController
//
//  Created by Luiz Guimarães on 27/03/21.
//

import UIKit

protocol CustomUIAlertControllerProtocol {
    
    var title: String? { get }
    var message: String? { get }
    var actions: [CustomUIAlertAction] { get }
    
    func addAction(_ customUIAlertAction: CustomUIAlertAction)
}
