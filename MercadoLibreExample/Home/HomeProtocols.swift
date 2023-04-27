import Foundation
import UIKit

protocol HomeRouterProtocol: class {
    func goToSearchByText(search: String)
    func goToSearchByCategory(category: String)
}

protocol HomePresenterProtocol: class {
    func onViewDidLoad()
    func onGetCategoriesSuccess(result: [CategoryResult])
    func onGetCategoriesError(error: Error)
    func getNumberOfRows(section: Int) -> Int
    func getTextsSearchedSelected(index: Int) -> String
    func getTextsSearched() -> [String]
    func saveTextSearched(text: String)
    func searchWithText(text: String)
    func getNumberOfRowsCollection(section: Int) -> Int
    func getCollectionCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func tapCategory(indexPath: IndexPath)
}


protocol HomeInteractorProtocol: class {
    func getCategories()
    
    var presenter: HomePresenterProtocol?  { get set }
}


protocol HomeViewProtocol: class {
    func reloadCategoryData()
    
    var presenter: HomePresenterProtocol?  { get set }
}
