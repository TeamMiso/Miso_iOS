import UIKit
import Then
import SnapKit

final class MainVC: BaseVC {
    
    private let misoLabel = UILabel().then {
        $0.text = "\"미소\""
        $0.textColor = UIColor(rgb: 0x1C1C1E)
        $0.textAlignment = .center
        $0.font = .Miso(size: 20, family: .light)
    }
    
    private let gotoSignupButton = UIButton().then {
        $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        $0.tintColor = UIColor(rgb: 0x0F0F0F)
    }
    
    private let logoutButton = UIButton().then {
        $0.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        $0.tintColor = UIColor(rgb: 0x000000)
    }

    private let menuLabel = UILabel().then {
        $0.text = "메뉴"
        $0.textColor = UIColor(rgb: 0x1C1C1E)
        $0.textAlignment = .center
        $0.font = .Miso(size: 25, family: .extraLight)
    }
    
    
    
    
    
    override func addView() {
        view.addSubviews(
            misoLabel,
            gotoSignupButton,
            logoutButton,
            menuLabel
        )
    }
    
    override func setLayout() {
        misoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.leading.equalToSuperview().offset(15)
        }
        gotoSignupButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.top.equalTo(misoLabel.snp.top)
            $0.trailing.equalTo(logoutButton.snp.leading).offset(-22)
        }
        logoutButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.top.equalTo(misoLabel.snp.top)
            $0.trailing.equalToSuperview().inset(14)
        }
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(misoLabel.snp.bottom).offset(86)
            $0.leading.equalTo(misoLabel.snp.leading)
        }
    }
    
    
    
}
