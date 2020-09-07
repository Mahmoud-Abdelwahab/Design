//
//  ViewController.swift
//  Design
//
//  Created by kasper on 7/15/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var headerImage: UIImageView!
    
    
    
    var headerView: UIView!
    
     @IBOutlet weak var table: UITableView!
    let headerHeight : CGFloat = 250
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "home"
  
    
        // important part set the header = nil then add it as a subview
        table.dataSource = self
               table.delegate =   self
        headerView = table.tableHeaderView
        table.tableHeaderView = nil
        table.addSubview(headerView)
    //scroll table with the header height 
        table.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0 )
        table.contentOffset = CGPoint(x: 0, y: -headerHeight)

        //scroll y axis
        
        self.updateHeader()
        

   
    }
    
    
    func updateHeader()  {
        print(table.contentOffset.y)
        if table.contentOffset.y < -headerHeight{
            // iam scrolling to top i header height area it may become negative
            headerView.frame.origin.y = table.contentOffset.y
            headerView.frame.size.height = -table.contentOffset.y
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello Mahmoud : \(indexPath)"
        
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeader()
    }
    
    
}

