//
//  ViewController.swift
//  PickerView
//
//  Created by hallym-de1111 on 2019. 9. 18..
//  Copyright © 2019년 hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource { // 델리게이트 클래스를 상속 받음
    let MAX_ARRAY_NUM = 10 // 배열 객체 10개 선언
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80 // 룰렛의 높이 변경하기 = 80
    var imageArray = [UIImage?]() // imageArray 변수 선언
    var imageFileName = [ "01.png", "02.png", "03.png", "04.png", "05.png", // Images 그룹 폴더에 있는 파일들을 불러옴
                          "06.png", "07.png", "08.png", "09.png", "10.png" ]
    
    @IBOutlet var pickerImage: UIPickerView! // 델리게이트 완료(대리자라고 하며 누군가 해야 할 일을 대신 해주는 역할
    @IBOutlet var lblImageFileName: UILabel! // 처리해야할 일 일부를 다른 객체에게 넘김
    @IBOutlet var imageView: UIImageView! // 선택한 이미지를 이미지 뷰에 출력하기
    
    override func viewDidLoad() { // 프로그램시 자동으로 실행되는 코드
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0 ..< MAX_ARRAY_NUM { // 선택한 이미지를 이미지 뷰에 추가하기
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN // 델리게이트 메소드 추가 [ 피커뷰의 동작 코드 시작 ]
    }
    
    // return height of row for each component.
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    
    // returns the # of rows in each component ..
    func pickerView(_ PickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count // 델리게이트 메소드 추가
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { 
//     델리게이트 메소드 추가
//        return imageFileName[row]
//  }  titleForRow  앞에서 선언한 titleForRow 인수를 가지는 델리게이트 메소드를 주석 처리 
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int,
        reusing view: UIView?) -> UIView { // viewForRow 인수가 포함되어 있는 델리게이트 메소드 추가
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row] // 현재 선택된 이미지와 이미지 파일명 표시
        imageView.image = imageArray[row] // 선택한 이미지 이름과 해당 이미지 출력하기
    }


}

