import UIKit

class SearchItemView: UIViewController, SearchItemViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
	var presenter: SearchItemPresenterProtocol?
    var rowsCells: [SearchItemCell] = []
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.onViewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerCells()
    }
    
    func registerCells() {
        if let sections = presenter?.getSections() {
            for cell in sections {
                tableView.register(UINib(nibName: cell.identifier, bundle: nil), forCellReuseIdentifier: cell.identifier)
            }
        }
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

extension SearchItemView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getNumberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.presenter?.getCell(tableView: self.tableView, row: indexPath.row, section: indexPath.section) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.tapItem(indexPath: indexPath)
    }
}
