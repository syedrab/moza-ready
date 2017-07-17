//
//  CircleView.swift
//  moza-ready
//
//  Created by Syed Rab on 7/12/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
