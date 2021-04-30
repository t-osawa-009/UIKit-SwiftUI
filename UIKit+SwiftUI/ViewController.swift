import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }
    
    @IBAction private func pushSampleListViewButtonTapped(_ sender: Any) {
        let vc = SampleListDisplayController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func pushMewSampleButtonTapped(_ sender: Any) {
        let vc = MewSampleViewController(with: .init(), environment: ())
        navigationController?.pushViewController(vc, animated: true)
    }
}

