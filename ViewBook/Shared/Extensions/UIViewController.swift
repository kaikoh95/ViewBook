//
//  UIViewController.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: Generic UI Setup
    
    func firstSetup() {
        
        view.backgroundColor = UIColor.white // set background
        setupNavBar()
        setTransparentNavBar()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func createBackButton() -> UIButton {
        let arrowImg = UIImage(named: "arrowDown")
        let rotatedArrow = arrowImg?.rotate(radians: .pi / 2)
        let button = UIButton(type: .system)
        button.setImage(rotatedArrow, for: .normal)
        
        return button
    }
    
    func setupNavBar() {
        let arrowImg = UIImage(named: "arrowDown")
        let rotatedArrow = arrowImg?.rotate(radians: .pi / 2)
        let button = UIButton(type: .system)
        
        button.setImage(rotatedArrow, for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed(sender:)), for: UIControl.Event.touchUpInside)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func setTransparentNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func setLoadingView() -> (UIView, UIActivityIndicatorView) {
        
        var loadingView = UIActivityIndicatorView()
        var overlay = UIView()
        
        view.isUserInteractionEnabled = false
        
        overlay = UIView(frame: UIScreen.main.bounds)
        overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        overlay.center = view.center
        
        loadingView = UIActivityIndicatorView()
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        loadingView.style = .whiteLarge
        loadingView.color = .white
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 0.15 * view.frame.height, height: 0.15 * view.frame.height)
        loadingView.layer.cornerRadius = 0.02 * view.frame.height
        loadingView.center = overlay.center
        
        view.addSubview(overlay)
        overlay.addSubview(loadingView)
        loadingView.startAnimating()
        
        return (overlay, loadingView)
    }
    
    // MARK: Actions
    
    @objc func backButtonPressed(sender: UIBarButtonItem!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissKeyboard() {
        
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
