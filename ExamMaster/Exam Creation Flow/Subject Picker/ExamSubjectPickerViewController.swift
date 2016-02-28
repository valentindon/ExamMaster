//
//  ExamSubjectPickerViewController.swift
//  ExamMaster
//
//  Created by aleksey on 28.02.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation
import ModelsTreeKit

class ExamSubjectPickerViewController: UITableViewController {
  
  weak var model: ExamSubjectPickerModel! {
    didSet {
      model.applyRepresentation(self)
      title = model.title
    }
  }
  
  private var adapter: TableViewAdapter<String>!
  private var dataSource: ListDataSource<String, String>!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = ListDataSource(list: model)
    adapter = TableViewAdapter(dataSource: dataSource, tableView: tableView)
    
    adapter.registerCellClass(ItemCell)
    adapter.nibNameForObjectMatching = { _ in return String(ItemCell) }
    
    adapter.didSelectCellSignal.subscribeNext { [ weak self] _, subject in
      self?.model.selectSubject(subject!)
    }.putInto(pool)
    
    model.fetchSubjects()
  }
  
}