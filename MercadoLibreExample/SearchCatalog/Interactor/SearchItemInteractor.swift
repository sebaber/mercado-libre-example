import UIKit

class SearchItemInteractor: SearchItemInteractorProtocol {
    
    weak var presenter: SearchItemPresenterProtocol?
    
    func searchByText(search: String) {
        NetworkManager.shared.fetchSearch(search: search){ (result: Result<SearchResult>) in
            switch result {
            case .success(let result):
                self.presenter?.onSearchItemSuccess(result: result)
            case .failure(let error):
                self.presenter?.onSearchItemError(error: error)
            }
        }
    }
    
    func searchByCategory(category: String) {
        NetworkManager.shared.fetchCategoryResult(category: category){ (result: Result<SearchResult>) in
            switch result {
            case .success(let result):
                self.presenter?.onSearchItemSuccess(result: result)
            case .failure(let error):
                self.presenter?.onSearchItemError(error: error)
            }
        }
    }
}
