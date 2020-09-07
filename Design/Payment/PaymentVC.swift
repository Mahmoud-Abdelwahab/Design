//
//  PaymentVC.swift
//  Design
//
//  Created by kasper on 8/13/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

class PaymentVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationController?.title = " Payment "
        delivaryVC.view.isHidden = false
       
    }
    

    lazy var  delivaryVC  : DelivaryVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var delivertVC = storyboard.instantiateViewController(withIdentifier: "DelivaryVC") as! DelivaryVC
        self.addVcAsChiledVc(chiledViewControler : delivertVC)
        return delivertVC
        
    }()
    
    lazy var  addressVC  : AddressVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var addressVC = storyboard.instantiateViewController(withIdentifier: "AddressVC") as! AddressVC
        self.addVcAsChiledVc(chiledViewControler : addressVC)
        return addressVC
        
    }()
    
    lazy var  paymentMethodVC  : PaymentMethodVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var paymentMethodVC = storyboard.instantiateViewController(withIdentifier: "PaymentMethodVC") as! PaymentMethodVC
        self.addVcAsChiledVc(chiledViewControler : paymentMethodVC)
        return paymentMethodVC
        
    }()

    private func addVcAsChiledVc(chiledViewControler : UIViewController){
        addChild(chiledViewControler)
        containerView.addSubview(chiledViewControler.view)
        chiledViewControler.view.frame = view.bounds
        chiledViewControler.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        chiledViewControler.didMove(toParent: self)
    }
    
    @IBAction func didTapPayment(_ sender: Any) {
        paymentMethodVC.view.isHidden = false
        delivaryVC.view.isHidden = true
        addressVC.view.isHidden = true
    }
    
    @IBAction func didTapHome(_ sender: Any) {
        paymentMethodVC.view.isHidden = true
        delivaryVC.view.isHidden = true
        addressVC.view.isHidden = false
    }
    @IBAction func didTapDelivay(_ sender: Any) {
        paymentMethodVC.view.isHidden = true
        delivaryVC.view.isHidden = false
        addressVC.view.isHidden = true
    }
//    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
//        delivaryVC.view.isHidden = true
//        addressVC.view.isHidden = true
//        paymentMethod.view.isHidden = true
//
//
//        if sender.selectedSegmentIndex == 0
//        {
//            // show firstVC
//              delivaryVC.view.isHidden = false
//        }else if sender.selectedSegmentIndex == 1 {
//            //show secondeVc
//            addressVC.view.isHidden = false
//
//        }else if sender.selectedSegmentIndex == 2 {
//            //show secondeVc
//            paymentMethod.view.isHidden = false
//
//        }
//
//    }
//
    
//    func setUpTwoVCs(){
//
//
//        // i will add thies two as a childs
//
//        addChild(delivaryVC)
//        addChild(addressVC)
//        addChild(paymentMethod)
//
//        // i will add there views into the container also
////        containerView.addSubview(delivaryVC.view)
////        containerView.addSubview(addressVC.view)
////        containerView.addSubview(paymentMethod.view)
////
//        // i will set the frame of each of thies view  so i will call didMove in the VC
//        delivaryVC.didMove(toParent: self)
//
//        addressVC.didMove(toParent: self)
//
//           paymentMethod.didMove(toParent: self)
//
//        delivaryVC.view.frame = self.view.bounds
//        addressVC.view.frame = self.view.bounds
//
//         paymentMethod.view.frame = self.view.bounds
//        /// now the tw vc are showen but i want to show one only on the container so i will hide the seconde
//        addressVC.view.isHidden = true
//
//         paymentMethod.view.isHidden = true
//
//    }
//

}
