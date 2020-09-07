//
//  HeaderView.swift
//  Design
//
//  Created by kasper on 8/13/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

class HeaderView : UIView {
    
    lazy var stackView : UIStackView = {
        let stack = UIStackView()
        
        
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
