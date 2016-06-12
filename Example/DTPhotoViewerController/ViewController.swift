//
//  ViewController.swift
//  DTPhotoViewerController
//
//  Created by Tung Vo on 05/07/2016.
//  Copyright (c) 2016 Tung Vo. All rights reserved.
//

import UIKit
import DTPhotoViewerController

class ViewController: UIViewController {
    let topLeftView = UIImageView()
    let bottomLeftView = UIImageView()
    let topRightView = UIImageView()
    let bottomRightView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.makeLayout()
    }
    
    private let SCREEN_SIZE = UIScreen.mainScreen().bounds
    private let GAP_BETWEEN_VIEWS:CGFloat = 0.08
    
    func makeLayout() {
        
        // Create four Subviews
        topLeftView.translatesAutoresizingMaskIntoConstraints = false
        topLeftView.contentMode = UIViewContentMode.ScaleAspectFit
        topLeftView.image = UIImage(named: "hero-mario.png")
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.dynamicType.imageViewTapped(_:)))
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1
        topLeftView.userInteractionEnabled = true
        topLeftView.addGestureRecognizer(tapGesture1)
        
        topRightView.translatesAutoresizingMaskIntoConstraints = false
        topRightView.image = UIImage(named: "hero-mario.png")
        topRightView.contentMode = UIViewContentMode.ScaleAspectFit
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.dynamicType.imageViewTapped(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        topRightView.userInteractionEnabled = true
        topRightView.addGestureRecognizer(tapGesture2)
        
        bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftView.image = UIImage(named: "hero-mario.png")
        bottomLeftView.contentMode = UIViewContentMode.ScaleAspectFit
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(self.dynamicType.imageViewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1
        bottomLeftView.userInteractionEnabled = true
        bottomLeftView.addGestureRecognizer(tapGesture3)
        
        bottomRightView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightView.image = UIImage(named: "hero-mario.png")
        bottomRightView.contentMode = UIViewContentMode.ScaleAspectFit
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(self.dynamicType.imageViewTapped(_:)))
        tapGesture4.numberOfTapsRequired = 1
        tapGesture4.numberOfTouchesRequired = 1
        bottomRightView.userInteractionEnabled = true
        bottomRightView.addGestureRecognizer(tapGesture4)
        
        self.view.addSubview(topLeftView)
        self.view.addSubview(topRightView)
        self.view.addSubview(bottomLeftView)
        self.view.addSubview(bottomRightView)
        
        self.addConstraints()
    }
    
    func addConstraints() {
        self.addTopRightViewConstraints()
        self.addTopLeftViewConstraints()
        self.addBottomLeftViewConstraints()
        self.addBottomRightViewConstraints()
        self.addSpacingConstraints()
        self.addEqualConstraints()
    }
    
    func addTopRightViewConstraints() {
        let topRightViewTrailingConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let topRightViewTopConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topRightViewTrailingConstraint, topRightViewTopConstraint])
    }
    
    func addTopLeftViewConstraints() {
        let topLeftLeadingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let topLeftTopLeadingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topLeftLeadingConstraints, topLeftTopLeadingConstraints])
    }
    
    func addBottomLeftViewConstraints() {
        
        let bottomLeftViewLeadingConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let bottomLeftViewBottomConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([bottomLeftViewLeadingConstraint, bottomLeftViewBottomConstraint])
        
    }
    
    func addBottomRightViewConstraints() {
        let bottomRightViewTrailingConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let bottomRightViewBottomConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([bottomRightViewTrailingConstraint, bottomRightViewBottomConstraint])
    }
    
    func addSpacingConstraints() {
        let topHorizontalSpacingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: topRightView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        let bottomHorizontalSpacingConstraints = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: bottomRightView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        let leftVerticalSpacingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        let rightVerticalSpacingConstraints = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: bottomRightView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        NSLayoutConstraint.activateConstraints([topHorizontalSpacingConstraints, bottomHorizontalSpacingConstraints, leftVerticalSpacingConstraints, rightVerticalSpacingConstraints])
    }
    
    func addEqualConstraints() {
        let topEqualWidthConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: topRightView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        let topEqualHeightConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: topRightView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let leftEqualHeightConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let leftEqualWidthConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topEqualHeightConstraints, leftEqualHeightConstraints, topEqualWidthConstraints, leftEqualWidthConstraints])
    }
    
    func imageViewTapped(recognizer: UITapGestureRecognizer) {
        if let imageView = recognizer.view as? UIImageView {
            if let photoViewer = DTPhotoViewerController(referenceView: imageView, image: imageView.image) {
                self.presentViewController(photoViewer, animated: true, completion: nil)
            }
        }
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

