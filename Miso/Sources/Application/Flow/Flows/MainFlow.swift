import UIKit
import RxFlow

class MainFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .mainIsRequired:
            return self.navigateToMain()
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.loginIsRequired)
        }
    }
    
    private func navigateToMain() -> FlowContributors {
        let vc = MainVC()
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    
}
