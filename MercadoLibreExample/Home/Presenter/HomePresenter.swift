import UIKit

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    var categories: [CategoryResult] = []
    var textsSearched: [String] = []
    
    func onViewDidLoad() {
        LoadingView.shared.startAnimating()
        self.interactor?.getCategories()
    }
    
    func onGetCategoriesSuccess(result: [CategoryResult]) {
        LoadingView.shared.stopAnimating()
        self.categories = result
        
        if(self.categories.count == 0){
            NoResultsView.shared.showNoResults(title: "No encontramos categorias", description: "Intenta mas tarde nuevamente")
            return
        }
        
        
        self.view?.reloadCategoryData()
    }
    
    func onGetCategoriesError(error: Error) {
        LoadingView.shared.stopAnimating()
        ErrorView.shared.showError(message: "A ocurrido un Error", buttonTitle: "Reintentar") {
            ErrorView.shared.hideError()
            self.onViewDidLoad()
        }
    }
    
    func getCollectionCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(category: self.categories[indexPath.row])
        return cell
    }
    
    func tapCategory(indexPath: IndexPath){
        let categorySelcetd = self.categories[indexPath.row]
        self.router?.goToSearchByCategory(category: categorySelcetd.id)
    }
    
    func getNumberOfRowsCollection(section: Int) -> Int{
        return self.categories.count
    }
    
    func getTextsSearched() -> [String] {
        return self.textsSearched
    }
    
    func saveTextSearched(text: String) {
        self.textsSearched.append(text)
    }

    func getTextsSearchedSelected(index: Int) -> String{
        return self.textsSearched[index]
    }
    
    func getNumberOfRows(section: Int) -> Int {
        return self.textsSearched.count
    }
    
    func searchWithText(text: String) {
        self.router?.goToSearchByText(search: text)
    }
    
}
