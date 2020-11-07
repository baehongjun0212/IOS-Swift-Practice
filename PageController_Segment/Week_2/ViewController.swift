//
//  ViewController.swift
//  Week_2
//
//  Created by 한림1111 on 2019. 10. 3..
//  Copyright © 2019년 한림1111. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControler: UIPageControl!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    var imgFamily = ["family_1.jpg","famly_2.jpg","family_3.jpeg","family_4.jpg","family_5.jpg"]
    var imgFriend = ["friend_1.jpg","friend_2.jpeg","friend_3.jpg","friend_4.jpg","friend_5.png"]
    var isFamily = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.selectedSegmentIndex = 0
        pageControler.currentPage = 0 //vpdlwlzjs
        imgView.image = UIImage(named: imgFamily[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func segChanged(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            imgView.image = UIImage(named: imgFamily[0])
            pageControler.currentPage = 0
            isFamily = true
        }
        else{
            imgView.image = UIImage(named: imgFriend[0])
            pageControler.currentPage = 0
            isFamily = false
        }
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        if isFamily{
            imgView.image = UIImage(named: imgFamily[pageControler.currentPage])
        }else{
            imgView.image = UIImage(named: imgFriend[pageControler.currentPage])
        }  
    }
}


