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
        case .loginIsRequired:
            return navigateToLogin()
        }
    }
    
    private func navigateToMain() -> FlowContributors {
        let mainFlow = MainFlow()
        Flows.use(mainFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(
            flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.loginIsRequired)))
        
    }
    
    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.loginIsRequired)))
    }
}
