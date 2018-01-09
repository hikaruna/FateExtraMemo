//
//  EnemiesTableViewController.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class EnemiesTableViewController: UITableViewController {

    var enemyForSelectedRow: Enemy? {
        return tableView.indexPathForSelectedRow.flatMap { EnemyRepository.shared[$0.row] }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EnemyRepository.shared.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = EnemyRepository.shared[indexPath.row].name
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Segue(segue: segue)?.prepare(for: segue, context: self)
    }

    enum Segue: String, AssociatedSegue {
        case showDetail = "ShowDetail"

        func prepare(for segue: UIStoryboardSegue, context: EnemiesTableViewController) {
            switch self {
            case .showDetail:
                let enemyViewController = segue.destination as! EnemyViewController
                enemyViewController.enemy = context.enemyForSelectedRow!
            }
        }
    }
}
