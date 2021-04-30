import Foundation
import UIKit
import SwiftUI
import Mew

final class BodyViewController: UIHostingController<BodyView>, Instantiatable, Injectable {
    func input(_ input: Input) {
        
    }
    typealias Input = Void
    typealias Environment = Void
    private var swiftUIView: BodyView
    var environment: Void
    init(with input: Input, environment: Environment) {
        self.swiftUIView = BodyView()
        super.init(rootView: swiftUIView)
        view.backgroundColor = .clear
    }
    
    @available(*, unavailable)
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
