//
//  DemoViewController.swift
//  XIBonProgrammatic
//
//  Created by K Y on 9/20/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import UIKit

final class DemoViewController: UIViewController {
    
    lazy var buttonView: ButtonView = {
        let btn = ButtonView(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                         constant: 20.0),
            btn.topAnchor.constraint(equalTo: view.topAnchor,
                                         constant: 20.0),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                           constant: -20.0)
        ])
        return btn
    }()
    
    // MARK: - Lifecycle Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.delegate = self
    }

}

extension DemoViewController: ButtonViewDelegate {
    func didTapButton(_ button: ButtonView) {
        print("did tap button")
    }
}
