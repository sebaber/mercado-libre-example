import UIKit

class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomePresenterProtocol?
    
    func getCategories() {
        NetworkManager.shared.fetchCategories(){ (result: Result<[CategoryResult]>) in
            switch result {
            case .success(let result):
                self.presenter?.onGetCategoriesSuccess(result: result)
            case .failure(let error):
                self.presenter?.onGetCategoriesError(error: error)
            }
        }
    }
}
