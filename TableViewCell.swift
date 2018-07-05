//
//  TableViewCell.swift
//  DemoBTN
//
//  Created by Chien on 7/4/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit
protocol tableViewCellDelegate {
  func checker(sender : Int)
}

class TableViewCell: UITableViewCell {


  @IBOutlet weak var btCheck: UIButton!
  
  var delegate: tableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func configCell() -> Void {
   
  }
  
  @IBAction func checkboxTaped(_ sender: UIButton) {
   sender.isSelected = !sender.isSelected
    delegate?.checker(sender: btCheck.tag)
    configCell()
  }
  
}
