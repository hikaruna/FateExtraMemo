//
//  PatternCollectionCell.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class PatternCollectionViewCell: UICollectionViewCell {

    var card: Card? {
        didSet { updateUI() }
    }

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .blue : .clear
        }
    }
    
    @IBOutlet weak var view: UIButton!

    private func updateUI() {
        view.setTitle(card?.description ?? "?", for: .normal)
    }
}
