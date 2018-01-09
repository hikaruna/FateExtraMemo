//
//  EnemyPatternsTableDetailViewController.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class EnemyPatternsTableDetailViewController: UIViewController {

    var pattern: Pattern {
        get { return collectionViewController.pattern }
        set { collectionViewController?.pattern = newValue }
    }

    var index: Int? {
        get { return collectionViewController.index }
        set { collectionViewController.index = newValue }
    }

    @IBOutlet weak var patternLabel: UILabel!

    private var collectionViewController: PatternCollectionViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    func next() {
        collectionViewController.next()
    }

    private func updateUI() {
        updatePatternUI()
        updateIndexUI()
    }

    private func updatePatternUI() {
        patternLabel.text = pattern.description
    }

    private func updateIndexUI() {

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Segue(segue: segue)?.prepare(for: segue, context: self)
    }

    enum Segue: String, AssociatedSegue {
        case embedCollection = "EmbedCollection"
        case embedController = "EmbedController"

        func prepare(for segue: UIStoryboardSegue, context: EnemyPatternsTableDetailViewController) {
            switch self {
            case .embedCollection:
                print("embedCollection")
                context.collectionViewController = segue.destination as! PatternCollectionViewController
                context.collectionViewController.pattern = Pattern()
                context.collectionViewController.index = 0
            case .embedController:
                let controller = segue.destination as! ControllerViewController
                controller.delegate = context
            }
        }
    }
}

extension EnemyPatternsTableDetailViewController: ControllerViewControllerDelegate {
    func didTouchAttackButton() {
        guard let index = self.index else { return }
        pattern[index] = .attack
        next()
        updateUI()
        collectionViewController.pattern = pattern
    }

    func didTouchGuardButton() {
        guard let index = index else { return }
        pattern[index] = .guardd
        next()
        updateUI()
    }

    func didTouchBreakButton() {
        guard let index = index else { return }
        pattern[index] = .breakk
        next()
        updateUI()
        collectionViewController.pattern = pattern
    }
}
