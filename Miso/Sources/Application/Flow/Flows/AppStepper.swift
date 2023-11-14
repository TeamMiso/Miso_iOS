import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {
    
    let steps = PublishRelay<Step>()
    
    private let disposeBag = DisposeBag()
    
    init() {
        
    }
    
    var initialStep: Step {
        return DemoStep.loginIsRequired
    }
}
