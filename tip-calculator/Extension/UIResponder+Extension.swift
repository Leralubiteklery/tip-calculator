//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by v.sauchanka on 26.10.2026.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
