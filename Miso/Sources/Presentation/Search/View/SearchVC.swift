import UIKit

final class SearchVC: BaseVC<Any> {
    
    override func setup() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x1C1C1E)
    }
    
//    private let searchTextField = UITextField().then {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    
}
