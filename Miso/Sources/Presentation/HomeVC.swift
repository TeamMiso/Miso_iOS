import UIKit

final class HomeVC: BaseVC {
    
    private let nickNameLabel = UILabel().then {
        $0.text = "미소"
        $0.textColor = UIColor(rgb: 0x1C1C1E)
        $0.textAlignment = .left
        $0.font = .Miso(size: 20, family: .extraLight)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func setup() {
        self.view.backgroundColor = UIColor(rgb: 0xFAFAFA)
        
    }
    

}

