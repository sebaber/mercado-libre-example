//
//  ItemDetailViewController.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 26/04/2023.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let item: Item
    let sections = [
        ItemDetailCell(identifier: ItemDetailProductTableViewCell.identifier, type: .product)
    ]
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        for section in sections {
            self.tableView.register(UINib(nibName: section.identifier, bundle: nil), forCellReuseIdentifier: section.identifier)
        }
    }

}

extension ItemDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = self.sections[indexPath.section]
        
        if section.type == .product {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: section.identifier, for: indexPath) as! ItemDetailProductTableViewCell
            cell.setData(item: item)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
