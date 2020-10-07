//
//  PageViewController.swift
//  Telegramm
//
//  Created by Denis on 2/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    //MARK: - Variables
    var presentViews = [PresentHelper]()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Telegramm"
        
        setPageControllerTintColor()
        arrayFilling()
    }
    
    //MARK: - Create VC
    lazy var arrayPresentViewControllers: [PresentViewController] = {
        var presentVC = [PresentViewController]()
        for view in presentViews {
            presentVC.append(PresentViewController(presentWith: view))
        }
        return presentVC
    }()
    
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = .white
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayPresentViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

//MARK: - Methods
extension PageViewController {
    
    func setPageControllerTintColor() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self])
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPageIndicatorTintColor = .gray
    }
    
    
    func objectCreation(name: String, description: String) -> PresentHelper {
        
        var object = PresentHelper()
        
        if let image = UIImage(named: name) {
            object = PresentHelper(image: image, name: name, text: description)
        }
        return object
    }
    
    
    func arrayFilling() {
        presentViews.append(objectCreation(name: "Telegramm", description: "The world's fastest messaging app. It is free and secure."))
        presentViews.append(objectCreation(name: "Fast", description: "Telegramm delivers messages faster than any other application."))
        presentViews.append(objectCreation(name: "Free", description: "Telegramm is free forever. No ads. No subscription fees."))
        presentViews.append(objectCreation(name: "Powerful", description: "Telegramm has no limits in the size of yiur chats and media."))
        presentViews.append(objectCreation(name: "Secure", description: "Telegramm keeps your messages safe from hacker attacks."))
        presentViews.append(objectCreation(name: "Cloud-Based", description: "Telegramm lets you acess your messages from multiple devices."))
    }
    
    
}

//MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PresentViewController else { return nil }
        if let index = arrayPresentViewControllers.firstIndex(of: vc) {
            if index > 0 {
                return arrayPresentViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PresentViewController else { return nil }
        if let index = arrayPresentViewControllers.firstIndex(of: vc) {
            if index < presentViews.count - 1 {
                return arrayPresentViewControllers[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return presentViews.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
    
}

