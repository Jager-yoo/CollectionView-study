//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 유재호 on 2022/01/08.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var emojiCollectionView: UICollectionView!
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]
    // 스토리보드의 [Collection View Flow Layout] 를 사용할 거라면, 아래처럼 굳이 선언할 필요가 없다고 함.
    let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UICollectionViewDelegateFlowLayout 프로토콜은 UICollectionViewDelegate 프로토콜을 상속받음.
        emojiCollectionView.delegate = self
        emojiCollectionView.dataSource = self
        emojiCollectionView.isPagingEnabled = true
        
        // 스토리보드에서 컬렉션 뷰 레이아웃 쓸 거면, 이런 게 필요가 없다고!! (추정)
        emojiCollectionView.collectionViewLayout = flowLayout
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = .zero
        
        flowLayout.itemSize = CGSize(width: view.bounds.size.width, height: emojiCollectionView.bounds.size.height)
    }
    
    // 이 메서드를 통해 section 개수를 바꿔줄 수 있다. 안 바꾸면 1 임
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    // 데이터가 몇 개인지? -- section 은 디폴트로 1개로 잡혀있음.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    // 데이터가 무엇인지?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = emojiCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.emojiLabel.text = emojies[indexPath.item]
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .systemYellow
        
        return cell
    }

    //
}

