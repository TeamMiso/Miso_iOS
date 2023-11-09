import UIKit

final class SignupVC: BaseVC {
    
    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "SignupBackground")
    }
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xE5F0EC)
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
    }
    
    private let vcNameLabel = UILabel().then {
        $0.text = "Sign Up"
        $0.textColor = UIColor(rgb: 0x416A36)
        $0.textAlignment = .center
        $0.font = .Miso(size: 30, family: .extraLight)
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "Email"
        $0.textColor = UIColor(rgb: 0x292929)
        $0.textAlignment = .center
        $0.font = .Miso(size: 13, family: .extraLight)
    }
    
    private let emailView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xFAFAFA)
    }
    
    private let emailImageView = UIImageView().then {
        $0.image = UIImage(named: "Mail")
    }
    
    private let betweenView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private let emailTextfield = UITextField().then {
        $0.placeholder = "Email"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
            
    }
    
    override func addView() {
        view.addSubviews(
            backgroundImageView,
//            backgroundView,
            vcNameLabel
//            ,
//            emailLabel,
//            emailView,
//            emailImageView,
//            betweenView,
//            emailTextfield
        )
        
    }
    
    override func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(81)
        }
        vcNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.backgroundView.snp.top).offset(35)
            $0.centerX.equalToSuperview()
        }
//        emailLabel.snp.makeConstraints {
//            
//        }
    }
    
}
