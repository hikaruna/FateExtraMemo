//
//  ControllerViewController.swift
//  FateExtraMemo
//
//  Copyright © 2018年 hikaruna. All rights reserved.
//

import Foundation
import UIKit

class ControllerViewController: UIViewController {

    weak var delegate: ControllerViewControllerDelegate?

    @IBAction func didTouchAttackButton() {
        delegate?.didTouchAttackButton()
    }
    @IBAction func didTouchGuardButton() {
        delegate?.didTouchGuardButton()
    }
    @IBAction func didTouchBreakButton() {
        delegate?.didTouchBreakButton()
    }
}

protocol ControllerViewControllerDelegate: class {
    func didTouchAttackButton()
    func didTouchGuardButton()
    func didTouchBreakButton()
}
