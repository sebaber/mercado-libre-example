import UIKit

class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToSearchByText(search: String) {
        let searchItemVC = SearchItemModule.build(search: search, searchType: .text)
        viewController?.navigationController?.pushViewController(searchItemVC, animated: true)
    }
    
    func goToSearchByCategory(category: String) {
        let searchItemVC = SearchItemModule.build(search: category, searchType: .category)
        viewController?.navigationController?.pushViewController(searchItemVC, animated: true)
    }
}
