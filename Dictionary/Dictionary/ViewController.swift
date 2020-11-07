//
//  ViewController.swift
//  Dictionary
//
//  Created by hallym-de1111 on 2019. 9. 18..
//  Copyright © 2019년 20155127. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var KeyTF: UITextField!
    @IBOutlet var txtView: UITextView!
    
    var contry = ["이즈리얼 ":"BOT","가렌":"TOP","럼블":"TOP","라칸":"SUP","탈론":"MID","자야":"BOT","리신":"JUG","카직스":"JUG","피즈":"MID","파이크":"SUP","퀸":"TOP","티모":"TOP","다리우스":"TOP","징크스":"BOT",
		"알리스타":"SUP","피들스틱":"JUG","제라스":"MID","스웨인":"MID","판테온":"TOP","유미":"SUP"]
    var key: String = ""
    var value: String = ""
    
    override func viewDidLoad() { // 프로그램 시작시 자동으로 켜지는 코드
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func listFunc(){ // key 값을 호출해 텍스트 뷰에 띄워주는 함수 선언
        txtView.text = "" //공백 표시

        for (key, value) in contry{ 
            txtView.text = txtView.text! + "\(key) : \(value) \n"
        }
    }
    @IBAction func btnList(_ sender: UIButton) { // 리스트를 띄워즈는 함수 선언
        txtView.text = ""
        for (key, value) in contry{
            txtView.text = txtView.text! + "\(key) : \(value) \n"
        }
    }
    
    @IBAction func btnSearch(_ sender: UIButton) { // 리스트 검색 버튼 함수 선언
        key = KeyTF.text! // 입력받은 key의 값을 검색한다.
        value = contry[key]!
        txtView.text = ""
        txtView.text = "\(key) : \(value)"
    }
    
    @IBAction func btnInsert(_ sender: UIButton) { //리스트 인서트 버튼 함수 선언
        key = KeyTF.text! 
        contry[key] = value
        txtView.text = ""
        
        for row in contry {
            let(key,value) = row
            txtView.text = txtView.text! + "\(key) : \(value) \n"
        }
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) { // 리스트 업데이트 버튼 함수 선언
        key = KeyTF.text!
        contry.updateValue(value, forKey: key)
    }
    
    @IBAction func btnRemove(_ sender: UIButton) { // 리스트 삭제 버튼 함수 선언
        key = KeyTF.text!
        contry[key] = nil
        txtView.text = ""
        
        for row in contry {
            let (key,value) = row
            txtView.text = txtView.text!+"\(key) : \(value) \n"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

