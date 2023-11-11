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
    
    private let emailTextfield = NormalTextField(placeholder: "Email").then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let passwordLabel = UILabel().then {
        $0.text = "Password"
        $0.textColor = UIColor(rgb: 0x292929)
        $0.textAlignment = .center
        $0.font = .Miso(size: 13, family: .extraLight)
    }
    
    private let passwordTextfield = SecureTextField(placeholder: "Password").then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let rePasswordLabel = UILabel().then {
        $0.text = "RePassword"
        $0.textColor = UIColor(rgb: 0x292929)
        $0.textAlignment = .center
        $0.font = .Miso(size: 13, family: .extraLight)
    }
    
    private let rePasswordTextfield = SecureTextField(placeholder: "RePassword").then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        rePasswordTextfield.delegate = self
    }
    
    override func addView() {
        view.addSubviews(
            backgroundImageView,
            backgroundView,
            vcNameLabel,
            
            emailLabel,
            emailTextfield,
            
            passwordLabel,
            passwordTextfield,
            
            rePasswordLabel,
            rePasswordTextfield
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
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(vcNameLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(32)
        }
        emailTextfield.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextfield.snp.bottom).offset(22)
            $0.leading.equalTo(emailLabel)
        }
        passwordTextfield.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        rePasswordLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextfield.snp.bottom).offset(22)
            $0.leading.equalTo(emailLabel)
        }
        rePasswordTextfield.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(rePasswordLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
}

extension SignupVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
