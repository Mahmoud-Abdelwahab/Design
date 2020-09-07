//
//  CardCell.swift
//  Design
//
//  Created by kasper on 8/10/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var CardView: UIView!
    
    static var identifier = "CardCell"
       
       @IBOutlet weak var orderName: UILabel!
    

       override func awakeFromNib() {
           super.awakeFromNib()
//        let gradiantLayer = CAGradientLayer()
//        
//        gradiantLayer.colors
//            = [#colorLiteral(red: 0.9109163284, green: 0.3388370872, blue: 0.3073034883, alpha: 1) , #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)]
//        gradiantLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradiantLayer.endPoint  = CGPoint(x: 1, y: 1)
//        gradiantLayer.frame     = self.bounds
//        self.layer.insertSublayer(gradiantLayer, at: 0)
       }
      
       static func nib()-> UINib {
           return UINib(nibName: "CardCell", bundle: nil)
       }
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

       }
}
