//
//  ViewController.swift
//  MyCollectionView
//
//  Created by Yeni Hwang on 2021/08/18.
//

import UIKit

class ViewController: UIViewController {

    let cellIdentifier: String = "cell"
    //Friend타입들의 배열인 friends를 만들고 빈 배열 선언
    var friends: [Friend] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // jsonDecoder
        let jsonDecoder: JSONDecoder = JSONDecoder()
        // "friends" 파일을 dataAsset으로 가져오기
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        //
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
    }
    



}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        return self.numberOfCell
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // guard let으로 바꾸기
        let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        let friend: Friend = self.friends[indexPath.item]
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fullAdress
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.numberOfCell += 1
        collectionView.reloadData()
    }
}

