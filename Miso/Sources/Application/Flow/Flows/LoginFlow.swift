import UIKit
import RxFlow

class LoginFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let vc = UINavigationController()
        return vc
    }()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .mainIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.mainIsRequired)
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let vc = LoginVC()
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    
}
