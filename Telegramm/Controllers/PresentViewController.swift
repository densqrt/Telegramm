//
//  PresentViewController.swift
//  Telegramm
//
//  Created by Denis on 2/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    //MARK: - Image
    private let presentImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Labels
    private let presentName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let presentDescription: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Button
    private let startButton: UIButton = {
        let start = UIButton()
        start.setTitleColor(.blue, for: .normal)
        start.setTitle("Start Messaging", for: .normal)
        start.sizeToFit()
        start.translatesAutoresizingMaskIntoConstraints = false
        return start
    }()
    
    lazy var subView: [UIView] = [self.presentImage, self.presentName, self.presentDescription, self.startButton]
    
    //MARK: - Init
    
    init(presentWith: PresentHelper) {
        super.init(nibName: nil, bundle: nil)
        
        presentImage.image = presentWith.image
        presentName.text = presentWith.name
        presentDescription.text = presentWith.text
        
        for view in subView {
            self.view.addSubview(view)
        }
        
        //Constraints
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: presentImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 127),
            NSLayoutConstraint(item: presentImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 173),
            NSLayoutConstraint(item: presentImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -150),
            NSLayoutConstraint(item: presentImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: presentName, attribute: .top, relatedBy: .equal, toItem: presentImage, attribute: .bottom, multiplier: 1, constant: 80),
            NSLayoutConstraint(item: presentName, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: presentDescription, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: presentDescription, attribute: .top, relatedBy: .equal, toItem: presentName, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: presentDescription, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: startButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50),
            NSLayoutConstraint(item: startButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
