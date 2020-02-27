//
//  TodoCell.swift
//  TodoList
//
//  Created by Noah Braunfeld on 2/26/20.
//  Copyright © 2020 Noah Braunfeld. All rights reserved.
//

import UIKit

protocol TodoCellDelegate: class {
    func checkmarkTapped(sender: TodoCell)
}

class TodoCell: UITableViewCell {
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: TodoCellDelegate?
    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }
}
