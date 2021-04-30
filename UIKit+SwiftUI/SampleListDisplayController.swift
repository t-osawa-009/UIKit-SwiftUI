import UIKit
import SwiftUI
import Combine

final class SampleListDisplayController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "SampleListView(SwiftUI)"
        let rootView = SampleListView()
        rootView
            .relay
            .publisher
            .sink { [weak self] row in
                let ac = UIAlertController(title: "Taped Row: \(row)", message: nil, preferredStyle: .alert)
                ac.addAction(.init(title: "OK", style: .default, handler: nil))
                self?.present(ac, animated: true, completion: nil)
            }.store(in: &cancellables)
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - private
    private var cancellables = Set<AnyCancellable>()
}
