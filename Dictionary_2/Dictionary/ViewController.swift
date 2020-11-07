//
//  ViewController.swift
//  0925
//
//  Created by 한림1111 on 2019. 9. 25..
//  Copyright © 2019년 baehongjun. All rights reserved.
//

import UIKit
/* 딕셔너리는 키와 인스턴스로 이루어진 데이터의 모임입니다. 키로 인스턴스를 찾을 수 있습니다.
 키는 유일해야 하며 일반적으로 NSString 입니다. 키와 연결된 인스턴스는 데이터 유형에 관계가 없지만 nill은 안됩니다. */

class ViewController: UIViewController {
    var Dic = [1:["A","B"]] // 키값을 선언해줍니다.
    var Dic2 : [Int : [String]] = [:] // 정수형과 문자형으로 딕셔너리를 선언해줍니다.
    var Dic3 = [1:["AAA":"BBB"]] // 키값을 선언해줍니다.
    var Dic4 = ["김동영":["주소":"1211","전화번호":"010-1111-1111"]] // 딕셔너리를 선언해줍니다.
    @IBOutlet var lblText: UILabel! // 라벨 아울렛 변수 선언
    override func viewDidLoad() { // 프로그램 실행시 켜지는 함수
        super.viewDidLoad()
        Dic[2] = ["C","D"] // 딕셔너리를 호출합니다.
        for (DicKey, DicValue) in Dic{ // 키와 벨류를 선언해줍니다.
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+DicValue[1])
        }
        
        Dic2[1] = ["CC","DD"] // 딕셔너리의 첫번째 인덱스 값 변경
        Dic2[2] = ["KK","ZZ"] // 딕셔너리의 두번째 인덱스 값 변경
        Dic2[3] = ["HHH","AAA"] // 딕셔너리의 세번째 인덱스 값 변경
        Dic2.updateValue(["DDDD","ZZZZZ"],forKey: 2)
        for (DicKey, DicValue) in Dic2{
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+", "+DicValue[1])
            // 딕셔너리의 string형 키와 벨류값을 출력해줍니다.
        }
//        NSLog("Dic3[1] value's key : "+String(Dic3[1]!.keys.randomElement()!)+"Dic3[1] value's value : "+String(Dic3[1].values.randomElement()!))
        // 해당 부분은 버전 상의 차이로 주석 차리 하였습니다.
        // 키와 벨류가 상단에 하나가 선언되었고 키값 하나를 호출하겠다고 선언하는 randomElement 함수를 사용해줍니다.
        // 딕셔너리의 경우 배열처럼 가져오는게 아니라 키 값을 호출해야 하고,
        // 키 값은 한 개니까 randomElement를 이용해 호출을 합니다. (aaa)
        NSLog("Dic4[key]'s 주소 : "+Dic4["김동영"]!["주소"]!+" / Dic4[key]'s 전화번호 : "+Dic4["김동영"]!["전화번호"]!)
        // 주소라는 키를 출력하는 NSLog 출력문입니다.
    }
    
    
}

