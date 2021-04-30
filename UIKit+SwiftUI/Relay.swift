import Foundation
import Combine

/// https://stackoverflow.com/questions/59848687/binding-a-swiftui-button-to-anysubscriber-like-rxcocoas-button-tap
struct Relay<Element> {
    var call: (Element) -> Void { didCall.send }
    var publisher: AnyPublisher<Element, Never> {
        didCall.eraseToAnyPublisher()
    }

    // MARK: Private
    private let didCall = PassthroughSubject<Element, Never>()
}
