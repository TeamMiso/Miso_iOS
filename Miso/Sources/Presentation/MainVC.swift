import UIKit
import Then
import SnapKit

protocol CustomPageVCDelegate: class {
    func numberOfPage(atIndex: Int)
    func pageChangeTo(atIndex: Int)
}

final class MainVC: BaseVC {
    
    var currentIndex: Int?
    var pendingIndex: Int?
    
    var individualPageVCList = [UIViewController]()
    
    private let pageVC = UIPageViewController (
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    
    private lazy var pageControlButton = UIPageControl().then {
        $0.currentPageIndicatorTintColor = UIColor(rgb: 0x81A895)
        $0.pageIndicatorTintColor = UIColor(rgb: 0xD9D9D9)
        $0.numberOfPages = 4
        $0.currentPage = 0
    }
    
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
            pageControlButton,
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
            $0.width.equalTo(289)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(188)
        }
        
        pageControlButton.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.width.equalTo(160)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(168)
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
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        pendingIndex = individualPageVCList.firstIndex(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControlButton.currentPage = index
            }
        }
    }
}
