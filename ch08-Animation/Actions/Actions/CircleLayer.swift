//
//  CircleLayer.swift
//  Actions
//
//  Created by wj on 15/10/10.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit

class CircleLayer: CALayer {
    var radius:CGFloat = 0{ didSet{setNeedsDisplay()} }
    
    override init() {
        super.init()
        setNeedsDisplay()
    }
    override init(layer: Any) {
        super.init()
        setNeedsDisplay()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNeedsDisplay()
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(in ctx: CGContext) {
        ctx.setFillColor(UIColor.red.cgColor)
        let rect = CGRect(x: (bounds.size.width-radius)/2,
                          y: (bounds.size.height-radius)/2,
                      width: radius,
                     height: radius)
        ctx.addEllipse(in: rect)
        ctx.fillPath()
    }
    
    override class func needsDisplay(forKey key: String) -> Bool{
        if key == "radius"{return true}
        return super.needsDisplay(forKey: key)
    }
    
    override func action(forKey event: String) -> CAAction? {
        if let layer = presentation() {
            print(event)
            if event == "radius"{
                print("11")
                let anim = CABasicAnimation(keyPath: "radius")
                anim.fromValue = layer.value(forKey: "radius")
                return anim
            }
        }
        return super.action(forKey: event)
    }
    
}
