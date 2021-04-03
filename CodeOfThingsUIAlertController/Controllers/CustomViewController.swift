//
//  CustomViewController.swift
//  CodeOfThingsUIAlertController
//
//  Created by Luiz Guimarães on 28/03/21.
//

import UIKit

public class CustomViewController<CustomView: UIView>: UIViewController {
    var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("view is not a custom view")
        }
        return customView
    }
    public override func loadView() {
        view = CustomView()
    }
}
