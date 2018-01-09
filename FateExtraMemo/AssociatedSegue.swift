//
//  AssociatedSegue.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

protocol AssociatedSegue: RawRepresentable where RawValue == String {
    associatedtype ContextType where ContextType: UIViewController
    init?(segue: UIStoryboardSegue)
    func prepare(for segue: UIStoryboardSegue, context: ContextType)
}
extension AssociatedSegue {
    init?(segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else { return nil}
        self.init(rawValue: identifier)
    }
}
