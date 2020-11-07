//
//  ViewController.swift
//  0925 계산기
//
//  Created by 한림1111 on 2019. 9. 25..
//  Copyright © 2019년 baehongjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtCalcul: UITextField!
    @IBOutlet var txtVar: UITextField!
    // 계산 정보를 담아주는 텍스트 필드를 선언해줍니다.
    var result : Int! // 결과 값을 저장 변수 선언
    var num1 : Int! // 숫자 값을 저장하는 변수 선언
    var num2 : Int! // 숫자 값을 저장하는 변수 선언
    var op : String = "" // 연산자 문자형 선언
    var isInputNum : Bool! // 입력값을 bool 형 선언
    override func viewDidLoad() { // 프로그램 실행시 켜지는 코드
        super.viewDidLoad()
        isInputNum = true // 입력값을 true형으로 선언해줍니다.
        num1 = 0 // 두 자리 수의 연산을 할 것이라 변수 선언 2개를 해준다.
        num2 = 0
        op = "" // op는 연산자중 하나를 가지는 변수이다.
                // 자료형을 초기화 해준다. viewdidload, 초기에서 해주는게 좋다.
        result = 0 // 결과값을 저장하는 변수 선언
    }
    @IBAction func ButtonUpNum(_ sender: UIButton){
        /* 숫자 버튼을 클릭하였을 경우 작동하는 액션 함수.
        result구분이 있는 이유는 결과값이 있는 상태에서 추가적으로 값을 입력할 경우에 결과값에 이어서 계산할 수 있도록 하기위함이다.
        만약 결과값 이후 새로 숫자를 입력할 경우 초기화를 할 것이라면 코드를 수정해야 한다. */
        
        var digit = sender.currentTitle! // 누른 버튼의 title 문자
        // = 이 입력되었을 경우 결과값을 도출하는 부분이다.
        // button의 타이틀을 가져와서 무슨 연산자인지 확인을 위해 currenttitle을 사용한다.
        NSLog("result : " + String(result) + ", num1 : " + String(num1) + ", num2 :" + String(num2) + ", op : " + op)
        
        if(op == "" && result == 0) //
        { // 만약 연산자없이 바로 = 이 입력되었을 경우 num1 값을 바로 출력할 수 있도록 한다.
            NSLog("txtVar : " + txtVar.text!)
            //txtVar.text = nil
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtCalcul.text! + digit
            
        }
        else if(op == "" && result != 0)
        {
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtVar.text!
            
        }
        else
        {
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtCalcul.text! + digit
        }
        
    }
    
    @IBAction func ButtonUpClear(_ sender: UIButton) {
        // c버튼을 클릭했을 떄 작동하는 함수이다.
        // 모든값을 초기화 해준다.
        txtVar.text = ""
        txtCalcul.text = ""
        num1 = 0
        num2 = 0
        op = ""
        result = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonUpCancel(_ sender: UIButton) {
        // <- 버튼을 클릭하였을 경우 무낮열을 수정해주는 작업을 하는 함수
        // 주의할 점은 만약 지울 수 있는 내용이 없는 경우에는 예외처리를 해주어야 한다. 연산자는 지울수가 없다.
        if txtVar.text != ""
        {
            if(txtVar.text!.count>=2){
                let upperBound1 = String.Index(encodedOffset: txtVar.text!.count-2)
                let text1 = txtVar.text![...upperBound1]
                NSLog(String(text1))
                txtVar.text = String(text1)
            }
            else{
                txtVar.text = nil
            }
            if(txtCalcul.text!.count >= 2 )
            {
                let upperBound2 = String.Index(encodedOffset: txtCalcul.text!.count-2)
                // 예외처리
                let text2 = txtCalcul.text![...upperBound2]
                txtCalcul.text = String(text2)
            }
            else
            {
                txtCalcul.text = nil
            }
            
        }
    
}
    @IBAction func ButtonUpOperation(_ sender: UIButton) {
        let digit = sender.currentTitle! // 누른 버튼의 title 문자
        // sender.currenttitle을 사용하는 이유는 해당 버튼의 타이틀을 가져와서 무슨 연산자인지 확인하기 위해 사용하는 것이다.
        NSLog("op :" + op)
        NSLog("num1 :"+String(num1))
        NSLog("num2 :"+String(num2))
        if digit == "=" { // 만약 '='이 입력되었을 경우 결과값을 도출하는 부분이다.
            num2 = 0
            if(txtVar.text! == "")
            {
                num2 = 0
            }
            else
            {
                num2 = Int(txtVar.text!)
                // 만약 연산자없이 바로 =이 입력되었을 경우 바로 num1값을 출력할 수 있도록한다.
                // 그 외의 경우 연산 후 txtCalcul의 text로 출력하도록 한다.
                
            }
            NSLog("txtVar.text = " + txtVar.text!)
            if(num2 == 0)
            {
                result = num1
                txtVar.text = String(result)
                txtCalcul.text = ""
            }
            else{ // 각 연산자의 계산 코드를 선언해줍니다.
                if(op=="+"){
                    result = num1 + num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="-"){
                    result = num1 - num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="*"){
                    result = num1 * num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="/"){
                    result = num1 / num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
            }
            op = ""
            num1 = 0
            num2 = 0
            // 계산이 끝난 경우에는 num1, num2, op를 초기화한다.
        }
        else{
            if(op == ""){
                op = digit
                // '='이외의 값이라면 연산자를 op에 추가하도록 한다.
                num1 = Int(txtVar.text!)
                txtVar.text = ""
                txtCalcul.text = String(num1) + op
                // 만약 연산자가 입력이 되어있는데 다시 연산자를 누른다면 연산자를 -로 수정하고
                // calcul의 text를 +로 제거 후 -로 추가해 주는 작업을 한다.
            }
            else{
                op = digit
                
                var txtNum = txtCalcul.text!
                let startIndex = txtNum.startIndex
                let endIndex = txtNum.index(before:txtNum.endIndex)
                let range = startIndex..<endIndex
                // range를 사용하는 이유는 txtCalcul 문자열의 범위를 사용해 연산자 이전의 문자열만 사용하기 위함이다.
                // 따라서 range는 문자열 처음부터 마지막 문자열 인덱스 미만까지를 의미한다.
                /*
                 let start = txtNum.index(txtNum.startIndex, offsetBy: 1)
                 let end = txtNum.index(txtNum.endIndex, offsetBy: -3)
                 
                 let range1 = start..<end
                 NSLog("aaa:"+String(txtNum[range1]))
                 
                 
                 */
                num1 = Int(txtNum[range])
                NSLog(String(txtNum))
                NSLog(String(num1))
                txtVar.text = nil
                txtCalcul.text = String(num1) + op
            }
        }
        
    }
    
    
}



