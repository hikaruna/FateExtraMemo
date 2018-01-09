//
//  EnemyViewController.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class EnemyViewController: UIViewController {

    var enemy: Enemy! {
        didSet {
            if isViewLoaded {
                updateUI()
                patternsTableViewController.patterns = enemy.patterns
            }
        }
    }

    private var patternsTableViewController: EnemyPatternsTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    @IBAction func onPatternsAddButtonTouch(_ sender: UIBarButtonItem) {
        patternsTableViewController.performSegue(withIdentifier: "New", sender: sender)
    }

    @IBAction func unwindToEnemy(segue: UIStoryboardSegue) {
    }

    @IBAction func unwindToEnemyForSave(segue: UIStoryboardSegue) {
        patternsTableViewController.unwindToEnemyForSave(segue: segue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Segue(segue: segue)?.prepare(for: segue, context: self)
    }

    private func updateUI() {
        navigationItem.title = enemy.name
    }

    enum Segue: String, AssociatedSegue {
        case embedPatternsTable = "EmbedPatternsTable"

        func prepare(for segue: UIStoryboardSegue, context: EnemyViewController) {
            switch self {
            case .embedPatternsTable:
                context.patternsTableViewController = segue.destination as! EnemyPatternsTableViewController
                context.patternsTableViewController.patterns = context.enemy.patterns
            }
        }
    }
}
