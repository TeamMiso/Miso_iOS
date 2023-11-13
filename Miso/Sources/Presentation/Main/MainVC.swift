import UIKit
import Then
import SnapKit

final class MainVC: BaseVC {
    
    var option: [OptionEntity] = [
        OptionEntity(mainImageName: "RegisterRecycle", subImageName: "Camera", mainTitle: "재활용 등록하기.", subTitle: "Camera.", explain: "사진 촬영으로 재활용하는\n방법을 알아보자."),
        OptionEntity(mainImageName: "ExchangePoint", subImageName: "Market", mainTitle: "포인트 교환하기.", subTitle: "Shop.", explain: "재활용 등록을 통해 얻은\n포인트로 상품을 구매해보자."),
        OptionEntity(mainImageName: "Inquire", subImageName: "Write", mainTitle: "문의하기.", subTitle: "Inquiry.", explain: "등록되지 않은 재활용\n방법을 등록해보자."),
        OptionEntity(mainImageName: "ExchangePoint", subImageName: "Write", mainTitle: "문의 내역 보기.", subTitle: "List.", explain: "지금까지 문의한 내역을\n확인해보자.")
    ]
    
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
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .white
        return view
    }()
    
    private let flowLayout = UICollectionViewFlowLayout().then{
        $0.itemSize = CGSize(width: 289, height: 400)
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 40
    }
    
    
    override func setup() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(OptionCell.self, forCellWithReuseIdentifier: OptionCell.identifier)
        self.collectionView.collectionViewLayout = flowLayout
        flowLayout.minimumLineSpacing = 15
    }
    
    
    override func addView() {
        view.addSubviews(
            misoLabel,
            gotoSignupButton,
            logoutButton,
            menuLabel,
            collectionView
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
        collectionView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.top.equalTo(menuLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
 
    

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return option.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCell.identifier, for: indexPath)
        
        if let cell = cell as? OptionCell {
            cell.mainImageView.image = UIImage(named: option[indexPath.item].mainImageName)
            cell.subImageView.image = UIImage(named: option[indexPath.item].subImageName)
            cell.mainTitleLabel.text = option[indexPath.item].mainTitle
            cell.subTitleLabel.text = option[indexPath.item].subTitle
            cell.explainLabel.text = option[indexPath.item].explain
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


