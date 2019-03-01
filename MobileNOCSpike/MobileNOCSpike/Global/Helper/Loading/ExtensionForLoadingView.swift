//
//  ExtensionForLoadingView.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    private static var customLoadingView: LoadingView?
    private static var heightAnchor: NSLayoutConstraint?
    private static var widthAnchor: NSLayoutConstraint?
    
    var loadingView: LoadingView? {
        get { return UIViewController.customLoadingView }
        set { UIViewController.customLoadingView = newValue}
    }
    
    func showLoading(){
        DispatchQueue.main.async {
            self.setupLoadingView()
        }
    }
    
    func hideLoading(){
        DispatchQueue.main.async {
            self.removeLoadingView()
        }
    }
    
    private func setupLoadingView(){
        loadingView = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.first as? LoadingView
        if loadingView != nil{
            currentView().addSubview(loadingView!)
            setupLoadingViewConstraints()
        }
    }
    
    private func setupLoadingViewConstraints(){
        loadingView?.translatesAutoresizingMaskIntoConstraints = false
        loadingView?.centerXAnchor.constraint(equalTo: currentView().centerXAnchor).isActive = true
        loadingView?.centerYAnchor.constraint(equalTo: currentView().centerYAnchor).isActive = true
        loadingView?.widthAnchor.constraint(equalToConstant: currentView().frame.width).isActive = true
        loadingView?.heightAnchor.constraint(equalToConstant: currentView().frame.height).isActive = true
    }
    
    private func removeLoadingView(){
        if loadingView != nil{
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    private func currentView() -> UIView{
        if let view = self.tabBarController?.view{
            return view
        }else if let view = self.navigationController?.view{
            return view
        }else{
            return self.view
        }
    }
    
}










