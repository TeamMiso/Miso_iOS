import UIKit
import Then
import SnapKit

final class MainVC: BaseVC {
    
    var individualPageVCList = [UIViewController]()
    
    private let pageVC = UIPageViewController (
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    
    private lazy var 
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setup() {
        
        individualPageVCList = [
            PageDetailVC.getInstance(index: 0),
            PageDetailVC.getInstance(index: 1),
            PageDetailVC.getInstance(index: 2),
            PageDetailVC.getInstance(index: 3),
            PageDetailVC.getInstance(index: 4)
        ]
        
        pageVC.setViewControllers([individualPageVCList[0]], direction: .forward, animated: true, completion: nil)
        
        pageVC.dataSource = self
        pageVC.delegate = self
        
        pageVC.view.frame = contentView.frame
        
    }
    
    override func addView() {
        view.addSubviews(
            pageVC.view,
            contentView
        )
        contentView.addSubview(
            pageVC.view
        )
    }
    
    override func setLayout() {
        
        pageVC.view.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(188)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(43)
        }
        
    }
}

extension MainVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageVC = individualPageVCList.index(of: viewController)!
        
        if indexOfCurrentPageVC == 0 {
            return nil
        } else {
            return individualPageVCList[indexOfCurrentPageVC - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndexOfPageVC = individualPageVCList.firstIndex(of: viewController)!
        
        if currentIndexOfPageVC == individualPageVCList.count - 1 {
            return nil
        } else {
            return individualPageVCList[currentIndexOfPageVC + 1]
        }
        
        
    }
    
}


extension MainVC: UIPageViewControllerDelegate {
    
}

