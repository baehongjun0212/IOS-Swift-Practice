//
//  ViewController.swift
//  PhoneBook
//
//  Created by hallym-de1111 on 2019. 9. 18..
//  Copyright © 2019년 20155127. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var NameKey: UITextField!
    @IBOutlet var txtView: UITextView!
    var PhoneBook = ["럼블":"000-001","렝가":"000-002","가렌":"000-003","애니비아":"000-003","럭스":"000-004","바루스":"000-005","피즈":"000-006","다리우스":"000-007","니달리":"000-008","리신":"000-009","이즈리얼":"000-010",
		"그라가스":"000-011","파이크":"000-012","케이틀린":"000-013","카이사":"000-014","자야":"000-015","조이":"000-016","라칸":"000-017","징크스":"000-018","트리스타나":"000-019","루시안":"000-020","피들스틱":"000-021"]
    var key: String = ""
    var value: String = ""



    override func viewDidLoad() { // 프로그램 시작시 자동으로 켜지는 코드
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func listFunc(){
        txtView.text = "" // 텍스트 뷰 리스트 선언
        for(key, value) in PhoneBook{
            txtView.text = txtView.text + "\(key) : \(value) \n"
        }
    }
    @IBAction func btnList(_ sender: UIButton) { // 리스트 액션 함수 선언
        txtView.text = ""
        for (key, value) in PhoneBook{ // 전화번호부의 키 벨류값 선언
            txtView.text = txtView.text! + "\(key) : \(value) \n"
        }
        
    }
    @IBAction func btnSearch(_ sender: UIButton) { // 리스트 검색하는 함수 선언
        key = NameKey.text! // 입력받은 key의 값을 검색한다.
        value = PhoneBook[key]!
        txtView.text = ""
        txtView.text = "\(key) : \(value)"
    }
    @IBAction func btnInsert(_ sender: UIButton) { // 리스트 인서트 함수 선언
        key = NameKey.text! // 삽입할 key값을 입력받는다.
        PhoneBook[key] = value
        txtView.text = ""
        
        for row in PhoneBook {
            let(key,value) = row
            txtView.text = txtView.text! + "\(key) : \(value) \n"
        }
    }
    @IBAction func btnUpdate(_ sender: UIButton) {// 리스트 업데이트 함수 선언
        key = NameKey.text!
        PhoneBook.updateValue(value, forKey: key)
    }
    @IBAction func btnRemove(_ sender: UIButton) { // 리스트 삭제 함수 선언
        key = NameKey.text!
        PhoneBook[key] = nil
        txtView.text = ""
        
        for row in PhoneBook {
            let (key,value) = row
            txtView.text = txtView.text!+"\(key) : \(value) \n"
        }    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

