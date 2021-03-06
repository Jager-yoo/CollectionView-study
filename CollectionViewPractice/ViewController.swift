//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by μ μ¬νΈ on 2022/01/08.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var emojiCollectionView: UICollectionView!
    let emojies = ["π₯", "π₯°", "π₯²", "π", "π¨βπ¬", "π€ͺ", "πΈ", "βΎοΈ"]
    // μ€ν λ¦¬λ³΄λμ [Collection View Flow Layout] λ₯Ό μ¬μ©ν  κ±°λΌλ©΄, μλμ²λΌ κ΅³μ΄ μ μΈν  νμκ° μλ€κ³  ν¨.
    let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UICollectionViewDelegateFlowLayout νλ‘ν μ½μ UICollectionViewDelegate νλ‘ν μ½μ μμλ°μ.
        emojiCollectionView.delegate = self
        emojiCollectionView.dataSource = self
        emojiCollectionView.showsVerticalScrollIndicator = false
        emojiCollectionView.isPagingEnabled = true
        emojiCollectionView.collectionViewLayout = flowLayout
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = .zero
        flowLayout.itemSize = CGSize(width: view.bounds.size.width, height: emojiCollectionView.bounds.size.height)
    }
    
    // μ΄ λ©μλλ₯Ό ν΅ν΄ section κ°μλ₯Ό λ°κΏμ€ μ μλ€. μ λ°κΎΈλ©΄ 1 μ
    // λ§μ½ section κ°μλ₯Ό 2κ°λ‘ μ¬λ¦¬λ©΄, section νλλΉ 8κ°μ μ΄λͺ¨μ§κ° μμλλ° x 2 ν΄μ -> 16κ°μ μ΄λͺ¨μ§κ° λνλ¨
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // λ°μ΄ν°κ° λͺ κ°μΈμ§? -- section μ λν΄νΈλ‘ 1κ°λ‘ μ‘νμμ.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    // λ°μ΄ν°κ° λ¬΄μμΈμ§?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = emojiCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.emojiLabel.text = emojies[indexPath.item]
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .systemYellow
        
        return cell
    }

    //
}

