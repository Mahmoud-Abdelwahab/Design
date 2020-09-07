//
//  DesignCardView.swift
//  Design
//
//  Created by kasper on 8/12/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

@IBDesignable class DesignView  : UIView{
    
    override func layoutSubviews() {
                      layer.cornerRadius = 12
                      layer.shadowColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                      layer.shadowOpacity = 0.2
                      layer.shadowOffset = CGSize(width: 0, height: 10)
                      layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
    }
}
