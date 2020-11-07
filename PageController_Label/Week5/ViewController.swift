//
//  ViewController.swift
//  Week5
//
//  Created by 한림1111 on 2019. 10. 3..
//  Copyright © 2019년 한림1111. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var major = ["컴퓨터", "빅데이터", "IoT", "컨텐츠IT", "전자공학"]
    //현재 페이지의 위치를 저장하는 아울렛 변수
    
    @IBOutlet var lblMajor: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.currentPage = 0  //초기 페이지 0으로 설정
        lblMajor.text = major[0] //초기화면 레이블 0번째 텍스트 출력
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //페이지 컨트롤의 액션 함수
    @IBAction func pageChanged(_ sender: UIPageControl) {
        lblMajor.text = major[pageControl.currentPage] //페이지컨트롤러의 현재 페이지 값을 인덱스로 텍스트 레이블에 출력
    }
    
}

