//
//  ViewController.swift
//  DemoBTN
//
//  Created by Chien on 7/4/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

struct cellData {
  var opened = Bool()
  var title = String()
  var sectionData = [String]()
}

class TableViewController: UITableViewController,tableViewCellDelegate {
  
  var tableviewData = [cellData]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    tableviewData = [cellData(opened: false, title: "Miền Bắc", sectionData: ["Hà Nội","Hà Giang"]),
                     cellData(opened: false, title: "Miền Trung", sectionData: ["Đà Nẵng","Huế","Nghệ An"]),
                     cellData(opened: false, title: "Miền Nam", sectionData: ["TP.HCM"])]
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return tableviewData.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableviewData[section].opened == true {
      return tableviewData[section].sectionData.count + 1
    } else {
      return 1
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
      cell.textLabel?.text = tableviewData[indexPath.section].title
      cell.btCheck.tag = indexPath.row
      cell.delegate = self
      cell.configCell()
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
      cell.textLabel?.text = "    " +  tableviewData[indexPath.section].sectionData[indexPath.row - 1]
      cell.btCheck.tag = indexPath.row
      cell.configCell()
      cell.delegate = self
      return cell
    }
  }
  func checker(sender: Int) {
    if sender == 0 {
   
      tableView.reloadData()
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      if tableviewData[indexPath.section].opened == true {
        tableviewData[indexPath.section].opened = false
        let sections = IndexSet.init(integer : indexPath.section)
        tableView.reloadSections(sections, with: .none)
      } else {
        tableviewData[indexPath.section].opened = true
        let sections = IndexSet.init(integer : indexPath.section)
        tableView.reloadSections(sections, with: .none)
      }
    }
  }
}

