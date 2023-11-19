import UIKit
import RxSwift
import RxCocoa
import RxFlow
import Moya

class BaseVM {
    var disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
//    let keychain = Keychain()
//    let gomsRefreshToken = GOMSRefreshToken.shared
//    lazy var accessToken = "Bearer " + (keychain.read(key: Const.KeychainKey.accessToken) ?? "")
}

