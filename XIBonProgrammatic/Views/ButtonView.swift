//
//  ButtonView.swift
//  XIBonProgrammatic
//
//  Created by K Y on 9/20/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import UIKit

/// just a helper method
extension UIView {
    func setupToFill(superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

protocol ButtonViewDelegate: class {
    func didTapButton(_ button: ButtonView)
}

class ButtonView: UIView {
        
    // MARK: - Interface Builder Outlets
        
    @IBOutlet private var button: UIButton! {
        didSet {
            button.layer.masksToBounds = false
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 2.0
            button.backgroundColor = UIColor(red: 1.0,
                                             green: 0.0,
                                             blue: 0.0, alpha: 0.75)
        }
    }
    @IBOutlet var label: UILabel! {
        didSet { label.text = "PRESS ME" }
    }
    
    // MARK: - Properties
    
    weak var delegate: ButtonViewDelegate?
    
        // MARK: - Lifecycle Methods
    
        /*
            Similarly, we want to add in the view from an XIB
     
            Note: ensure we are the XIB's file owner to connect additional      outlets/methods/etc
         */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = loadViewFromNib() else { return }
        view.setupToFill(superView: self)
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        button.layer.cornerRadius = button.frame.width / 2.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented, but this could look like the other example")
    }
    
    @inline(__always) private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ButtonView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    @objc func buttonAction() {
        delegate?.didTapButton(self)
    }
}
