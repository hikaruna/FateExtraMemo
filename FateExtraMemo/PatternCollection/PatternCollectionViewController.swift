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

    var index: Int? {
        get { return collectionView?.indexPathsForSelectedItems?.first?.row }
        set {
            //deselectAll(animated: false)
            guard let newValue = newValue else { return }
            //collectionView!.reloadData()
            collectionView!.selectItem(
                at: IndexPath(row: newValue, section: 0),
                animated: false,
                scrollPosition: .left
            )
        }
    }
    
    func deselectAll(animated: Bool) {
        (0..<pattern.count).map { IndexPath(row: $0, section: 0) }.forEach {
            collectionView?.deselectItem(
                at: $0,
                animated: animated
            )
        }
    }
    
    func next() {
        guard let index = self.index else { return }
        guard (index + 1) < pattern.count else {
            self.index = nil
            return
        }
        self.index = index + 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pattern.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PatternCollectionViewCell
        cell.card = pattern[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelect \(indexPath)")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselect \(indexPath)")
    }
}
