//
//  ViewController.swift
//  MyDatePicker
//
//  Created by Yeni Hwang on 2021/06/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLable: UILabel!

    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .medium       // 데이터 포매터 스타일 지정. 문서 찾아보기
//        formatter.timeStyle = .medium       // 시간도 추가해줘보자
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"    // 원하는 방식으로
        return formatter
    } ()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value change")   // 날짜 바뀔 때마다 로그 찍기
        
        // DatePicker에서 바뀐 값이 넘어옴
        // sender는 매서드를 호출하는 친구(여기서는 DatePicker)
        let date: Date = sender.date    // outlet으로 선언했기 때문에 프로퍼티 self.datePicker.date로 사용해도 무방
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLable.text = dateString
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타깃 - 액션 self에, 위의 DatePickerValueChanged 메서드 호출해서, 바뀐거 확인하면 이벤트 효과를 주겠다.
        // 스토리보드에서 연결하고 효과 주는 것과 같은 기능의 코드
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }


}

