//
//  TipInputView.swift
//  tip-calculator
//
//  Created by v.sauchanka on 19.10.2026.
//

import UIKit
import SnapKit

class TipInputView: UIView {
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(
            topText: "Choose",
            bottomText: "your tip"
        )
        return view
    }()
    
    private lazy var tenPercentTipButton: UIButton = {
        let button = buildTipButton(tip: .tenPercent)
        return button
    }()
    
    private lazy var fifteenPercentTipButton: UIButton = {
        let button = buildTipButton(tip: .fifteenPercent)
        return button
    }()
    
    private lazy var twentyPercentTipButton: UIButton = {
        let button = buildTipButton(tip: .twentyPercent)
        return button
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ThemeColor.primary
        button.setTitle("Custon tip", for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.tintColor = .white
        button.addCornerRadius(radius: 8)
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            tenPercentTipButton,
            fifteenPercentTipButton,
            twentyPercentTipButton
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private lazy var buttonVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            horizontalStackView,
            customTipButton
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [headerView,  buttonVStackView].forEach(addSubview(_:))
        
        buttonVStackView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
        }
        
        headerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(buttonVStackView.snp.leading).offset(-24)
            $0.width.equalTo(68)
            $0.centerY.equalTo(horizontalStackView.snp.centerY)
        }
    }
    
    private func buildTipButton(tip: Tip) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(radius: 8)
        let text = NSMutableAttributedString(
            string: tip.stringValue,
            attributes: [
                .font: ThemeFont.bold(ofSize: 20),
                .foregroundColor: UIColor.white
            ]
        )
        text.addAttributes(
            [.font: ThemeFont.demiBold(ofSize: 14)],
            range: NSMakeRange(2, 1)
        )
        button.setAttributedTitle(text, for: .normal)
        return button
    }
}
