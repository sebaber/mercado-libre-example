import UIKit

class HomeModule {

    static func build() -> UIViewController {        
        let view = HomeView()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
