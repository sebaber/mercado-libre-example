import Foundation
import UIKit

protocol SearchItemRouterProtocol: class {
    func goToItemDetail(item: Item)
}

protocol SearchItemPresenterProtocol: class {
    func onViewDidLoad()
    func onSearchItemSuccess(result: SearchResult)
    func onSearchItemError(error: Error)
    func getSections() -> [SearchItemCell]
    func getNumberOfRows(section: Int) -> Int
    func getCell(tableView: UITableView, row: Int, section: Int) -> UITableViewCell
    func tapItem(indexPath: IndexPath)
}


protocol SearchItemInteractorProtocol: class {
    func searchByText(search: String)
    func searchByCategory(category: String)
    
    var presenter: SearchItemPresenterProtocol?  { get set }
}


protocol SearchItemViewProtocol: class {
    func reloadData()
    
    var presenter: SearchItemPresenterProtocol?  { get set }
}
