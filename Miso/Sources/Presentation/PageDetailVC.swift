import UIKit

final class PageDetailVC: BaseVC {
    
    var index: Int = 0
    
    private let titleLabel = UILabel().then {
        $0.textColor = UIColor(rgb: 0x1C1C1E)
        $0.textAlignment = .left
        $0.font = .Miso(size: 20, family: .extraLight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "index: \(index)"
        
        view.backgroundColor = index % 2 == 0 ? .systemRed : .systemCyan
    }
    
    override func addView() {
        view.addSubview(titleLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    static func getInstance(index: Int) -> PageDetailVC {
        let vc = PageDetailVC()
        
        vc.index = index
        
        return vc
    }
    
}
