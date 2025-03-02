import UIKit
import MonoCore

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6  // Changed from white to match App2's style
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App1 Updated: \(MonoCore.getSharedMessage())"
        label.textColor = .systemBlue
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}