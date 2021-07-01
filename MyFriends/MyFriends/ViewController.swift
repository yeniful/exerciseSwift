//
//  ViewController.swift
//  MyFriends
//
//  Created by Yeni Hwang on 2021/07/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    // cellIdentifier 선언
    let cellIdentifier: String = "cell"
    // friends 빈 리스트 만들어주기
    var friends: [Friend] = []
    
    // numberOfRowsInsection - row의 개수 알려주기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 0
        // 친구들의 수만큼 보여줘!
        return self.friends.count
    }
    
    // cellForRowAT - dequeueCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        
        // 셀에 데이터 넣어주기
        let friend: Friend = self.friends[indexPath.row]
            
        // 제목
        // cell.textLabel?.text = friend.name + "(\(friend.age))"
        cell.textLabel?.text = friend.nameAndAge
        // 부제목
        // cell.detailTextLabel?.text = friend.address_info.city + ", " + friend.address_info.country
        cell.detailTextLabel?.text = friend.fullAddress

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // view가 로드되면 해야할 일들! => json 데이터 에셋을 통해 데이터 불러오고 friends 배열에 넣어주기
        let jsonDecoder: JSONDecoder = JSONDecoder()
        // friends 이름의 에셋을 데이터로 사용할 것
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
    
        // json 데이터를 통해서 friend를 불러오기. 실패하면 에러 출력
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        // 테이블 뷰 리로드
        self.tableView.reloadData()
        
    }
}

