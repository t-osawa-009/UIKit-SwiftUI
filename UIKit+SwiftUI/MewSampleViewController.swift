import UIKit
import Mew

final class MewSampleViewController: UIViewController, Instantiatable {
    // MARK: - Mew.Instantiatable
    typealias Input = Model
    typealias Environment = Void
    let environment: Environment
    struct Model {}
    private var model: Model
    
    init(with input: Input, environment: Environment) {
        self.model = input
        self.environment = environment
        super.init(nibName: String(describing: MewSampleViewController.self), bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mew + SwiftUI"
        thumbnailViewController.input(.init(named: "150x150")!)
        bodyViewController.input(())
        thumbnail2ViewController.input(.init(named: "866-536x354")!)
        thumbnail3ViewController.input(.init(named: "237-536x354")!)
        backButtonViewController.input(.init())
        backButtonViewController.output { [weak self] output in
            switch output {
            case .buttonTapped:
                self?.navigationController?.popViewController(animated: true)
            }
        }
        
        scrollView.contentInset = .init(top: 0, left: 0, bottom: 75, right: 0)
    }
    
    // MARK: - private
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var scrollContainerView: ContainerView!
    @IBOutlet private weak var bottomContainerView: ContainerView!
    private lazy var thumbnailViewController = scrollContainerView.makeContainer(for: ThumbnailViewController.self, parentViewController: self)
    private lazy var thumbnail2ViewController = scrollContainerView.makeContainer(for: ThumbnailViewController.self, parentViewController: self)
    private lazy var thumbnail3ViewController = scrollContainerView.makeContainer(for: ThumbnailViewController.self, parentViewController: self)
    private lazy var bodyViewController = scrollContainerView.makeContainer(for: BodyViewController.self, parentViewController: self)
    private lazy var backButtonViewController = bottomContainerView.makeContainer(for: BackButtonViewController.self, parentViewController: self)
}
