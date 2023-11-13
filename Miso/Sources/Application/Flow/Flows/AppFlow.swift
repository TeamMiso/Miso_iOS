import UIKit
import RxFlow
import RxCocoa
import RxSwift

class AppFlow: Flow {
    
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        
        switch step {
        case .mainIsRequired:
            return navigateToMain()
        case .loginIsRequired
        }
    }
    
    private func navigateToMain() -> FlowContributors {
        let vc = MainVC()
        
        
    }
    
    private func navigateToLogin() -> FlowContributors {
        let vc = LoginVC()
        
    }
    
    
}
