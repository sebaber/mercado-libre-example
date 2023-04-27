import UIKit

class SearchItemModule {

    static func build(search: String, searchType: SearchType) -> UIViewController {
        let view = SearchItemView()
        let interactor = SearchItemInteractor()
        let router = SearchItemRouter()
        let presenter = SearchItemPresenter(search: search, searchType: searchType)

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
