//
//  EnemyPatternsTableViewController.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class EnemyPatternsTableViewController: UITableViewController {

    var patterns: [Pattern]!

    var patternForSelectedRow: Pattern? {
        return tableView.indexPathForSelectedRow.flatMap { patterns[$0.row] }
    }

    @IBAction func unwindToEnemyForSave(segue: UIStoryboardSegue) {
        let newIndexPath = IndexPath(row: patterns.count, section: 0)
        let sourceViewController = segue.source as! EnemyPatternsTableDetailViewController
        patterns.append(sourceViewController.pattern)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = patterns[indexPath.row].description
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Segue(segue: segue)?.prepare(for: segue, context: self)
    }

    enum Segue: String, AssociatedSegue {
        case showDetail = "ShowDetail"
        case addItem = "AddItem"

        func prepare(for segue: UIStoryboardSegue, context: EnemyPatternsTableViewController) {
            switch self {
            case .showDetail:
                let detailViewController = segue.destination as! EnemyPatternsTableDetailViewController
                detailViewController.pattern = context.patternForSelectedRow!
            case .addItem:
                let detailViewController = segue.destination as! EnemyPatternsTableDetailViewController
                detailViewController.pattern = Pattern()
            }
        }
    }
}
