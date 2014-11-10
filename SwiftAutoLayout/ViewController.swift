//
//  ViewController.swift
//  SwiftAutoLayout
//
//  Created by Kar Roderick Sze Hsing on 11/10/14.
//  Copyright (c) 2014 Cloudyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func makeLayout() {
        // make a view
        let view1 = UIView()
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)
        view1.backgroundColor = UIColor.redColor()
        
        // make a second view
        let view2 = UIView()
        view2.setTranslatesAutoresizingMaskIntoConstraints(false)
        view2.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.1, alpha: 1.0)
        
        // add the views
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        
        // constraints
        // make dictionary for views
        let viewsDictionary = ["view1":view1, "view2":view2]
        
        // sizing constraints
        // view1
        let view1_constraint_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let view1_constraint_W:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        view1.addConstraints(view1_constraint_H)
        view1.addConstraints(view1_constraint_W)
        
        // view2
        let view2_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:[view2(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view2_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:[view2(>=40)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        view2.addConstraints(view2_constraint_H)
        view2.addConstraints(view2_constraint_V)
        
        // position constraints
        // vieews
        let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[view2]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-36-[view1]-[view2]-0-|", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1, alpha: 1.0)
        makeLayout()
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
