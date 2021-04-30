import Foundation
import UIKit
import SwiftUI
import Mew
import Combine

final class ThumbnailViewController: UIHostingController<ThumbnailView>, Instantiatable, Injectable {
    func input(_ input: UIImage) {
        self.swiftUIView.image = input
    }

    typealias Input = UIImage
    typealias Environment = Void
    let environment: Environment
    private var swiftUIView: ThumbnailView
    private var cancellables: Set<AnyCancellable> = .init()
    init(with input: Input, environment: Environment) {
        self.environment = environment
        self.swiftUIView = ThumbnailView(image: input)
        super.init(rootView: swiftUIView)
        view.backgroundColor = .clear
    }
    
    @available(*, unavailable)
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
