//
//  EnemyRepository.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation

enum EnemyRepository {
    case shared

    private static var enemies: [Enemy] = [
        Enemy(name: "vipper"),
        Enemy(name: "mebious")
    ]

    var count: Int { return 2 }
    subscript(index: Int) -> Enemy {
        return EnemyRepository.enemies[index]
    }
}
