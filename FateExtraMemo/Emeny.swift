//
//  Emeny.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation

class Enemy {
    let name: String
    var patterns: [Pattern] = []

    init(name: String) {
        self.name = name
    }
}

class Pattern: CustomStringConvertible {
    var first: Card?
    var second: Card?
    var third: Card?

    var description: String {
        return all.map { $0?.description ?? "?" }.joined(separator: " ")
    }

    let count: Int = 3

    private var all: [Card?] {
        return [ first, second, third ]
    }

    init(first: Card? = nil, second: Card? = nil, third: Card? = nil) {
        self.first = first
        self.second = second
        self.third = third
    }

    subscript(index: Int) -> Card? {
        get { return all[index] }
        set {
            switch index {
            case 0:
                first = newValue
            case 1:
                second = newValue
            case 2:
                third = newValue
            default:
                fatalError()
            }
        }
    }
}

enum Card: String, CustomStringConvertible {
    case breakk = "B"
    case attack = "A"
    case guardd = "G"

    var description: String {
        return rawValue
    }
}
