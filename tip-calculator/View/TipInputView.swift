//
//  TipInputView.swift
//  tip-calculator
//
//  Created by v.sauchanka on 19.10.2026.
//

import UIKit

class TipInputView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .red
    }
}
