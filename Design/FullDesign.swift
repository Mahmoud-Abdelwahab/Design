//
//  FullDesign.swift
//  Design
//
//  Created by kasper on 7/28/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

class FullDesign: UIViewController {
    var isShowen = false
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cardTopConstaint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//         self.navigationController?.navigationBar.shadowImage = UIImage()
        
//        self.navigationController?.navigationBar.alpha = 0
//        self.navigationController?.navigationBar.isTranslucent = true
//         self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        title = " Resturantes"
        
        
        navigationController?.navigationBar.tintColor = .green
        // Do any additional setup after loading the view.
        scrollView.delegate = self
    }
    

    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func showBtn(_ sender: UIButton) {
 
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "phtop33"), for: .default)
        //self.navigationController?.navigationBar.shadowImage = UIImage(named: "phtop33")
                
    
                self.navigationController?.navigationBar.isTranslucent = true
        title = " Resturantes.."
        
        
        navigationController?.navigationBar.tintColor = .blue
        
            }
    
    @IBAction func dismiss(_ sender: Any) {
        print("pressed")
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}


extension FullDesign : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
         print("got it \(cardTopConstaint.constant)")
        if cardTopConstaint.constant < scrollView.contentOffset.y {
            print("got it 😍 ")
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "phtop33"), for: .default)
                                                 self.navigationController?.navigationBar.shadowImage = UIImage(named: "phtop33")
                                                             
                                                 
                                                             self.navigationController?.navigationBar.isTranslucent = true
                                                     title = " Resturantes.."
                                                     
                                                     
                                                     navigationController?.navigationBar.tintColor = .blue
                                                 
                                                       isShowen = true
                                   
                           
           
        }else{
            
            
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            
            
            
            navigationController?.navigationBar.tintColor = .green
                  isShowen = false
            
        
           
        }
    }
}
