import UIKit
import SnapKit
import Then
import RxFlow
import RxCocoa
import RxSwift

class BaseVC<T>: UIViewController {
    
    let viewModel: T
    var disposeBag = DisposeBag()
    // MARK: - Properties
    let bound = UIScreen.main.bounds
    // MARK: - LifeCycle
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setup()
        setupBackgroundIfNotSet()
        addView()
        setLayout()
        bind(reactor: viewModel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayoutSubviews()
    }
    
    // MARK: - Method
    private func setupBackgroundIfNotSet() {
        if self.view.backgroundColor == nil {
            self.view.backgroundColor = .white
        }
    }
    
    
    func setup() {}
    func addView() {}
    func setLayout() {}
    func setLayoutSubviews() {}
    
    func bind(reactor: T) {
        bindView(reactor: reactor)
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    func bindView(reactor: T) {}
    func bindAction(reactor: T) {}
    func bindState(reactor: T) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

