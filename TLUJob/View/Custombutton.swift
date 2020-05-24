//
//  Custombutton.swift
//  TLUJob
//
//  Created by toilalam on 4/22/20.
//  Copyright © 2020 Liam Vu. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class UIPButton : UIButton {
@IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
        self.layer.cornerRadius = cornerRadius
        setNeedsDisplay()
    }
}

@IBInspectable var borderColor: UIColor = UIColor.clear {
    didSet {
        self.layer.borderColor = borderColor.cgColor
        setNeedsDisplay()
    }
}

@IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
        self.layer.borderWidth = borderWidth
        setNeedsDisplay()
    }
}
        @IBInspectable var shadowColor: UIColor = UIColor.black {
            didSet {
                self.updateView()
            }
        }
        @IBInspectable var shadowOpacity: Float = 0.5 {
            didSet {
                self.updateView()
            }
        }
        @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3) {
            didSet {
                self.updateView()
            }
        }
        @IBInspectable var shadowRadius: CGFloat = 15.0 {
            didSet {
                self.updateView()
            }
        }

        //Apply params
        func updateView() {
            self.layer.shadowColor = self.shadowColor.cgColor
            self.layer.shadowOpacity = self.shadowOpacity
            self.layer.shadowOffset = self.shadowOffset
            self.layer.shadowRadius = self.shadowRadius
        }
    }
