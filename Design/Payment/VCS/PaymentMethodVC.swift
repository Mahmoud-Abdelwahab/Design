//
//  PaymentMethodVC.swift
//  Design
//
//  Created by kasper on 8/13/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

class PaymentMethodVC: UIViewController {

    
       @IBOutlet weak var textDirCheck: UILabel!
       @IBOutlet weak var imageDirCheck: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green

        // Do any additional setup after loading the view.
        textDirCheck.text = "Language Check...".localized
    }
    
    
    //******* this is how we flip the image direction
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let image = UIImage(named: "right-arrow")?.imageFlippedForRightToLeftLayoutDirection()
        
        imageDirCheck.image = image
        
    }
    
    @IBAction func didTapChangeLanguage(_ sender: Any) {
        if  LocalizationManger.shared.getLanguage() == .Arabic{
            LocalizationManger.shared.setlanguage(langauge: .English)
        }else{
             LocalizationManger.shared.setlanguage(langauge: .Arabic)
        }
    }
   
    
  

}
