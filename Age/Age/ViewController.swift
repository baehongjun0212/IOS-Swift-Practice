//
//  ViewController.swift
//  01
//
//  Created by 20155127_배홍준 on 2019. 9. 25..
//  Copyright © 2019년 20155127_배홍준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 라벨과 텍스트 필드 아울렛 변수 선언
    @IBOutlet var lbl: UILabel!
    @IBOutlet var yearTF: UITextField!
    @IBOutlet var monthTF: UITextField!
    @IBOutlet var dayTF: UITextField!
    
    
    @IBAction func btn(_ sender: UIButton) {
        // 버튼 액션 변수 선언
        let date = NSDate()

        let yearForm = DateFormatter() // 년도를 설정하는 코드
        yearForm.dateFormat = "yyyy"
        let year = yearForm.string(from: date as Date)
        let yearCurrent = Int(year)!
        var yearYour = Int(yearTF.text!)!

        let monthForm = DateFormatter() // 월을 설정하는 코드
        monthForm.dateFormat = "MM"
        let month = monthForm.string(from: date as Date)
        let monthCurrent = Int(month)!
        var monthYour = Int(monthTF.text!)!
    
        let dayForm = DateFormatter() // 일을 설정하는 코드
        dayForm.dateFormat = "dd"
        let day = dayForm.string(from: date as Date)
        let dayCurrent = Int(day)!
        var dayYour = Int(dayTF.text!)!
        
        var dayAge = 0 // 일에 해당하는 나이값 초기화
        var monthAge = 0 // 월에 해당하는 나이값 초기화
        
        dayAge = dayCurrent - dayYour // 일 나이 계산. daycurrent - dayyour
        if (dayAge < 0){ // 만약 일 나이가 음수인 경우
            let temp = dayCurrent - dayYour // 그 차이값을 temp에 저장
            dayAge = 30 + temp // 일 차이값을 30+temp로 저장
            monthYour+=1 // 월 +1
        }
        
        monthAge = monthCurrent - monthYour // 월 나이 계산 monthcurrent - monthyour
        if (monthAge < 0){ // 만약 월 나이가 음수인 경우
            let temp = monthCurrent - monthYour // 그 차이값을 temp에 저장
            monthAge = 12 + temp // 월 차이값을 12+temp로 저장
            yearYour+=1 // 년 +1
        }
        
        lbl.text = "" // 텍스트를 공백으로 만들어 놓고
        lbl.text =  "당신의 정확한 나이는 \n\(yearCurrent-yearYour)년\(monthAge)개월\(dayAge)일 입니다." // 출력
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

