//
//  ViewController.swift
//  Week_2
//
//  Created by 한림1111 on 2019. 10. 3..
//  Copyright © 2019년 한림1111. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scale: CGFloat = 1.0
    var oWidth: CGFloat = 300.0
    var oHeight: CGFloat = 300.0
    @IBOutlet var slider: UISlider!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControler: UIPageControl!
    
    
    var imgFamily = ["family_1.jpg","famly_2.jpg","family_3.jpeg","family_4.jpg","family_5.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControler.currentPage = 0 //vpdlwlzjs
        imgView.image = UIImage(named: imgFamily[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        slider.maximumValue = 2
        slider.minimumValue = 0
        slider.value = 1
    }
    @IBAction func slChanged(_ sender: UISlider) {
        var nWidth: CGFloat, nHeight : CGFloat
        
        scale = CGFloat(slider.value)
        nWidth = oWidth*scale
        nHeight = oHeight*scale
        imgView.frame.size = CGSize(width: nWidth, height: nHeight)
        imgView.image = UIImage(named: imgFamily[pageControler.currentPage])
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
       imgView.image = UIImage(named: imgFamily[pageControler.currentPage])
         
    }
}


