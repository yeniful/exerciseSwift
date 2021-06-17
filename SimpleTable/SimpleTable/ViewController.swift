//
//  ViewController.swift
//  SimpleTable
//
//  Created by Yeni Hwang on 2021/06/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    // 섹션 두 개
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "U", "V", "W", "X", "Y", "Z"]
    
    // 데이터들 빈 array로 초기화
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    // data button 누르면
    @IBAction func touchUpAddButton(_sender: UIButton) {
        dates.append(Date())    // 현재 시간 추가
        
//         self.tableView.reloadData() 데이터를 다 불러오는거라 비효율
        
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)    // 애니메이션 추가
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self      // tableview의 delegate와 dataSrc를 뷰컨트롤러와 코드로 연결
        self.tableView.dataSource = self    // 근데 스토리보드에서 이미 연결해줬는데 상관은 없나..? 중복 X?
    }

    // 밑에 넘겨줄 numberOfSections 값
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // korean 섹션과 english 섹션, date 섹션! 총 2개
    }
    
    // section에 해당되는 row의 갯수가 몇개인지 알려줘 몇 개 표현해야해?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션마다 row를 다르게 할거야. korean 먼저 보여주고 english 보여줄거야
        switch section {
        case 0:
            return korean.count     // korean array의 원소 개수
        case 1:
            return english.count    // enlgish array의 원소 개수
        case 2:
            return dates.count      // 날짜 섹션
        default :
            return 0
        }
    }
    
    // row마다 해당되는 cell을 알려줘
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 아까 만들어준 재사용 identifier와 매개변수로 넘겨받은 indexPath
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        
        // indexPath가 2보다 작을 때 (korean이나 english일 때)
        if indexPath.section < 2{
            // section의 indexPath가 0이면, korean 섹션에서 가져오고, 아니면 english 섹션에서 가져온다
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
                
            // cell에 표현될 데이터 세팅
            cell.textLabel?.text = text
            
        } else { // date인 경우 date만 따로 처리
            cell.textLabel?.text = self.dateFormatter.string(from: self.dates[indexPath.row])
        }
        
        
        return cell
    }
    
    // 섹션마다 타이틀 주기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // korean이나 english 일 때만 타이틀 주고
        if (section < 2){
            return section == 0 ? "한글" : "영어"
        }
        return nil  // date일 때는 타이틀 주지 않는다
    }
}
