import UIKit
import MonoCore

// App2 ViewController - Testing post-commit hook
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App2 Updated Again: \(MonoCore.getSharedMessage())"
        label.textColor = .systemBlue
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}