//
//  PatternCollection.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class PatternCollectionViewController: UICollectionViewController {

    var pattern: Pattern! {
        didSet {
            collectionView?.reloadData()
        }
    }

    var index: Int?

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pattern.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PatternCollectionViewCell
        cell.card = pattern[indexPath.row]
        cell.isSelected = indexPath.row == index
        return cell
    }
}
