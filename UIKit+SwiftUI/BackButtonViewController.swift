import UIKit
import Mew
import SwiftUI
import Combine

final class BackButtonViewController: UIHostingController<BackButtonView>, Instantiatable, Injectable, Interactable {
    enum Output {
        case buttonTapped
    }
    private var handler: ((Output) -> Void)?
    func output(_ handler: ((Output) -> Void)?) {
        self.handler = handler
    }
    
    func input(_ input: Input) {
        self.input = input
    }
    struct Input {}
    typealias Environment = Void
    let environment: Environment
    var input: Input
    private var swiftUIView: BackButtonView
    private var cancellables = Set<AnyCancellable>()
    init(with input: Input, environment: Environment) {
        self.input = input
        self.environment = environment
        swiftUIView = BackButtonView()
        super.init(rootView: swiftUIView)
        
        swiftUIView
            .relay
            .publisher
            .sink { [weak self] _ in
                self?.handler?(.buttonTapped)
            }.store(in: &cancellables)
        view.backgroundColor = .clear
    }
    
    @available(*, unavailable)
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
