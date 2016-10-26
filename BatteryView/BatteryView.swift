//
//  BatteryView.swift
//  BatteryView
//
//  Created by EasyHoony on 2016/10/25.
//  Copyright © 2016年 EasyHoony. All rights reserved.
//

import UIKit

private extension CATextLayer {

    var textSize: CGSize {
    
        let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]
        if let size = (string as? NSString)?.boundingRect(with: .zero, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil).size {
        return size
        }
        return .zero
    }
}

class BatteryView: UIView {
    
    var batteryHandler: ((CGFloat) -> Void)?
    
    private var _precent: CGFloat = 0
    
    private var _lineWidth: CGFloat = 2
    
    var minValue: Int = 0 {
        didSet {
        
        }
    }
    
    var maxValue: Int = 100 {
        didSet {
        
        }
    }
    var currentValue: Int = 0 {
        didSet {
          _precent = CGFloat(currentValue - minValue) / CGFloat(maxValue - minValue)
        }
    }
   
    var batteryBackgroundColor = UIColor(red: 72 / 255.0, green: 58 / 255.0, blue: 106 / 255.0, alpha: 1.00) {
        didSet {
        
        }
    }
    
    var progressColor = UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 1.00) {
        didSet {
            
        }
    }

    private var _backgrpundLayer: CAShapeLayer!
    
    private var _progressLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        self.isUserInteractionEnabled = true
        _initLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _initLayer() {
        let path = UIBezierPath(rect: CGRect(x: 10, y: 0, width: bounds.width - 20, height: _lineWidth))
        _backgrpundLayer                 = CAShapeLayer()
        _backgrpundLayer.backgroundColor = backgroundColor?.cgColor
        _backgrpundLayer.lineWidth       = _lineWidth
        _backgrpundLayer.position        = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        _backgrpundLayer.bounds          = CGRect(origin: .zero, size: bounds.size)
        _backgrpundLayer.path            = path.cgPath
        layer.addSublayer(_backgrpundLayer)
        
    
    }

    
}




















