import UIKit
import SnapKit
import Then


class MenuInitVC: UIViewController {
    
    var mainImageName = ""
    var subImageName = ""
    var mainTitle = ""
    var subTitle = ""
    var explainTitle = ""
    
    init(mainImageName: String = "", subImageName: String = "", mainTitle: String = "", subTitle: String = "", explainTitle: String = "") {
        self.mainImageName = mainImageName
        self.subImageName = subImageName
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.explainTitle = explainTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x81A895)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private let mainImageView = UIImageView()
    
    private let subImageView = UIImageView()
    
    private let mainTitleLabel = UILabel().then {
        $0.textColor = UIColor(rgb: 0xFAFAFA)
        $0.textAlignment = .left
        $0.font = .Miso(size: 20, family: .extraLight)
    }
    
    private let subTitleLabel = UILabel().then {
        $0.textColor = UIColor(rgb: 0xFAFAFA)
        $0.textAlignment = .left
        $0.font = .Miso(size: 15, family: .extraLight)
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xD0DDD7)
    }
    
    private let explainLabel = UILabel().then {
        $0.textColor = UIColor(rgb: 0xFAFAFA)
        $0.textAlignment = .left
        $0.font = .Miso(size: 20, family: .extraLight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        setLayout()
    }
    
    func setup() {
        
        self.view.frame = contentView.frame
        
        mainImageView.image = UIImage(named: "\(mainImageName)")
        subImageView.image = UIImage(named: "\(subImageName)")
        mainTitleLabel.text = "(\(mainTitle)"
    }
    
    func addView() {
        view.addSubview(contentView)
        
        
    }
    
    func setLayout() {
        contentView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.width.equalTo(289)
        }
        
    }
    
    
}

