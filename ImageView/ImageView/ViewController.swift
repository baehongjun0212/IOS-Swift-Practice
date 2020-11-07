//
//  ViewController.swift
//  ImageView
//
//  Created by hallym-de1111 on 2019. 9. 4..
//  Copyright © 2019년 Eunah-Kim. All rights reserved.
//

import UIKit

//뷰 컨트롤러 클래스 선언문
class ViewController: UIViewController {
    //변수 추가하기
    var isZoom = false //확대 여부
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
    //추가한 소스
    var isUse = false // 사용 여부
    var imgCoffee: UIImage? // 커피 이미지
    
    // 아웃렛 변수를 추가합니다.
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var btnUse: UIButton! // 사용버튼
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //이미지 지정 후 보여주기
        imgOn = UIImage(named: "lamp-on.png")
        imgOff = UIImage(named: "lamp-off.png")
        imgCoffee = UIImage(named: "lamp-remove.png")
        
        imgView.image = imgOn
        
    }

//버튼에 대한 액션
    @IBAction func btnResizeImage(_ sender: UIButton) {
    //버튼 클릭 시 동작하는 함수 코딩
        let scale: CGFloat = 2.0
        var newWidth:CGFloat,newHeight:CGFloat
        
        
        if(isZoom){ //true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            imgView.frame.size=CGSize(width: newWidth, height: newHeight)
            
            btnResize.setTitle("확대", for: .normal)
        }
        else{ //false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            
            btnResize.setTitle("축소", for: .normal)
        }
        isZoom = !isZoom
    }

    @IBAction func btnUseImage(_ sender: UIButton) {
    //사용과 제거에 대한 액션 함수 코딩
        if(!isUse){ //false
            imgView.image = imgCoffee //커피 이미지로 바꿈
            btnUse.setTitle("제거", for: .normal)
        }
        else{ //true
            imgView.image = imgOn
            btnUse.setTitle("사용", for: .normal)
        }
        isUse = !isUse
    }
    
    //스위치에 대한 액션 추가하기
    @IBAction func swithImageOnOff(_ sender: UISwitch) {
    //스위치 클릭 시 동작하는 함수 코딩
        if(isUse) {
            if sender.isOn {
                imgView.image = imgOn
            } else {
                imgView.image = imgOff
            }
        }
    }
}

