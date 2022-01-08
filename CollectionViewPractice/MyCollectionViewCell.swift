//
//  MyCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 유재호 on 2022/01/08.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    let codeLabel: UILabel = { // UILabel 은 클래스.
        let label = UILabel()
        label.text = "요호호"
        return label
    }() // 열고 닫는 소괄호()가 없으면 그냥 클로저임. 매개변수랑 리턴 타입을 갖는 '타입'이라는 말임.
    // 소괄호를 열고 닫았다는 건, 클로저를 '실행' 시켰다는 것임. 그 리턴값을 다시 uiLabel 에 집어넣게 된다는 뜻
}
