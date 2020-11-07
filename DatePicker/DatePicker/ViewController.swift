//
//  ViewController.swift
//  DatePicker
//
//  Created by hallym-de1111 on 2019. 9. 11..
//  Copyright © 2019년 Bae_Hong Jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var AlarmStop: UIButton! // 알람중지 아울렛 변수 선언
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var isRed : Bool! // 색깔 변수 선언
    
    @IBOutlet var lblCurrentTime: UILabel! // 현재 시간 아울렛 변수 선언
    @IBOutlet var lblPickerTime: UILabel! // 선택 시간 아울렛 변수 선언
    
    var alarm : String!
    override func viewDidLoad() { // 이미지 뷰가 켜질때 자동적으로 호출
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo:nil, repeats: true)
        // 1초마다 Timer 객체를 생성하여 selector된 ViewController.updateTime 함수를 호출한다.
        isRed = false
        AlarmStop.isEnabled = false // 알람중지 버튼 비활성화 선언
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) { // 데이트 피커의 액션함수
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        alarm = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() // 시간을 계속 업데이트 하기위한 함수
    {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        if( (formatter.string(from: date as Date) == alarm) && isRed == false)
        {
            view.backgroundColor = UIColor.red // 백그라운드 색을 빨간색으로 변경
            isRed = true
            AlarmStop.isEnabled = true // 알람중지 활성화
            NSLog("Same Date : "+formatter.string(from: date as Date) + " / " + alarm)
            
        }
        if(isRed == true && count < 60)
        {
            NSLog(String(count))
            count = count + 1 // 시간 증가
            if(count == 60)
            {
                AlarmStopfunc()
            }
        }
    }
    @IBAction func AlarmStop(_ sender: UIButton) { // 알람중지의 액션함수
            if(isRed == true) // 배경색이 빨간색일시
            {
                AlarmStopfunc() // 알람중지 함수 활성화
            }
        }
        
        func AlarmStopfunc() // 알람중지 함수
        {
            isRed = false
            count = 0
            view.backgroundColor = UIColor.white // 색을 다시 하얀색으로 변경
            AlarmStop.isEnabled = false // 알람중지 버튼 비활성화
            alarm = nil
        }
        
    }
