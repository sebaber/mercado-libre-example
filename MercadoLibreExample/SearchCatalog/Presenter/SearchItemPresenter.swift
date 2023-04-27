import UIKit

class SearchItemPresenter: SearchItemPresenterProtocol {
    
    weak var view: SearchItemViewProtocol?
    var interactor: SearchItemInteractorProtocol?
    var router: SearchItemRouterProtocol?
    
    var items: [Item] = []
    var sections: [SearchItemCell]
    
    let search: String
    let searchType: SearchType

    init(search: String, searchType: SearchType) {
        self.search = search
        self.searchType = searchType
        self.sections = [
            SearchItemCell(identifier: ItemViewCell.identifier, type: .item)
        ]
    }
    
    func getSections() -> [SearchItemCell] {
        return self.sections
    }
    
    func getNumberOfRows(section: Int) -> Int {
        return self.items.count
    }
    
    func onViewDidLoad() {
        LoadingView.shared.startAnimating()
        
        if self.searchType == .text {
            self.interactor?.searchByText(search: self.search)
        } else {
            self.interactor?.searchByCategory(category: self.search)
        }
    }
    
    func onSearchItemSuccess(result: SearchResult) {
        LoadingView.shared.stopAnimating()
        self.items = []
        for itemResult in result.results {
            self.items.append(Item(title: itemResult.title, price: itemResult.price, availableQuantity: itemResult.availableQuantity, soldQuantity: itemResult.soldQuantity, typeCell: .item, thumbnail: itemResult.thumbnail))
        }
        
        if(self.items.count == 0){
            NoResultsView.shared.showNoResults(title: "No encontramos publicaciones", description: "Revisa que la palabra esté bien escrita. Tambien puedes probar con menos términos o más generales")
            return
        }
        
        self.view?.reloadData()
    }
    
    func onSearchItemError(error: Error) {
        LoadingView.shared.stopAnimating()
        ErrorView.shared.showError(message: "A ocurrido un error", buttonTitle: "Reintentar") {
            ErrorView.shared.hideError()
            self.onViewDidLoad()
        }
    }
    
    func getCell(tableView: UITableView, row: Int, section: Int) -> UITableViewCell {
        let section = self.sections[section]

        if section.type == .item {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.identifier) as? ItemViewCell else { return UITableViewCell() }
            cell.setData(item: self.items[row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tapItem(indexPath: IndexPath){
        let itemSelected = self.items[indexPath.row]
        self.router?.goToItemDetail(item: itemSelected)
    }
    
}
