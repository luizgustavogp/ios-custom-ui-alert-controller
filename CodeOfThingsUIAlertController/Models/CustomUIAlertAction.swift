//
//  CustomUIAlertAction.swift
//  CodeOfThingsUIAlertController
//
//  Created by Luiz Guimarães on 01/04/21.
//

import UIKit

struct CustomUIAlertAction {
    
    let title: String
    let handler: (() -> Void)?
    let invertColor: Bool
    
    init(title: String, invertColor: Bool = false, handler: (() -> Void)? = nil) {
        self.title = title
        self.invertColor = invertColor
        self.handler = handler
    }
}
