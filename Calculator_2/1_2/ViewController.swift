//
//  ViewController.swift
//  1_2
//
//  Created by 20155127_배홍준 on 2019. 9. 25..
//  Copyright © 20155127_배홍준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var key = 0 // Keyno를 초기화 해줍니다.
    var sw: Bool = false // 정답을 bool값으로 초기화 선언해줍니다.
    var op = "" // 공백표시
    var msgRes =  "" // 공백표시
    var oper = ["+", "-", "*", "/"]  // 연산자 배열을 + - * / 4가지로 선언합니다.

    @IBOutlet var num1: UITextField! // 숫자 아울렛 변수 선언
    @IBOutlet var num2: UITextField!
    @IBOutlet var lbl: UILabel! // 라벨 아울렛 변수 선언
    @IBOutlet var lblOperator: UILabel! // 연산 변수 선언
    @IBOutlet var lblEqual: UILabel! // = 변수 선언
    @IBOutlet var input: UITextField! // 입력값 변수 선언
    
    override func viewDidLoad() { // 프로그램 시작시 자동으로 켜지는 코드
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 9월 25일 실습때 작성한 계산기 코드를 사용했습니다.
    @IBAction func btnNo(_ sender: UIButton) { // 숫자 버튼 액션 함수 선언
        key = Int(sender.currentTitle!)!
        if sw == false{
            num1.text = "\(key)"
        }
        else{
            num2.text = "\(key)"
        }
    }
    @IBAction func btnOperation(_ sender: UIButton) { // 연산자 버튼 액션 함수 선언
        sw = true
        op = sender.currentTitle!
        lblOperator.text = op
    }
    
    @IBAction func btnEqu(_ sender: UIButton) { // equal 버튼 액션 함수 선언
        let op1 = Int(num1.text!)!
        let op2 = Int(num2.text!)!
        lblEqual.text = "="
        
        switch op { // 스위치 문으로 연산문을 작성해줍니다.
        case "+":
            let res = op1 + op2
            msgRes = "\(res)"
        case "-":
            let res = op1 - op2
            msgRes = "\(res)"
        case "*":
            let res = op1 * op2
            msgRes = "\(res)"
        case "/":
            let res = op1 / op2
            msgRes = "\(res)"
            
        default:
            msgRes = "error"
        }
        lbl.text = msgRes
        sw = false
    }
    
    @IBAction func btnClear(_ sender: UIButton) { // 클리어 버튼 액션 함수 선언
        lblEqual.text = "" // 공백표시를 해줍니다.
        lbl.text = ""
        lblOperator.text = ""
        num1.text = ""
        num2.text = ""
        lbl.text = ""
    }
    
    @IBAction func btnTest(_ sender: UIButton) { // 문제를 출력하는 함수입니다.
        lbl.text = "" // 공백표시를 해줍니다.
        num1.text = String(Int(arc4random_uniform(UInt32(100)))) // 랜덤값을 출력해줍니다.
        num2.text = String(Int(arc4random_uniform(UInt32(100)))) // 랜덤값을 출력해줍니다.
        lblOperator.text = oper[Int(arc4random_uniform(UInt32(4)))]
        lblEqual.text = "="
    }
    @IBAction func btnCheck(_ sender: UIButton) { // 체크버튼 액션 함수 선언
        let op1 = Int(num1.text!)!
        let op2 = Int(num2.text!)! // 택스트값 정수로 형변환
        var res = 0
        op = lblOperator.text!
        
        switch op { // 연산자 종류를 스위치문으로 선언해줍니다.
        case "+":
            res = op1 + op2
        case "-":
            res = op1 - op2
        case "*":
            res = op1 * op2
        case "/":
            res = op1 / op2
        default:
            msgRes = "error" // 아닐시 에러메시지 선언
        }

        if Int(input.text!)! == res { // 만약 정답일 경우
            lbl.text = "정답" // 출력
        }
        else{ // 오답일 경우
            lbl.text = "오답" // 출력
        }
        
    }
    
}

