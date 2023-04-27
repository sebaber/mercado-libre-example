import UIKit

class SearchItemRouter: SearchItemRouterProtocol {
    
    weak var viewController: UIViewController?

    func goToItemDetail(item: Item) {
        let itemDetailVC = ItemDetailViewController(item: item)
        viewController?.navigationController?.pushViewController(itemDetailVC, animated: true)
    }
}
