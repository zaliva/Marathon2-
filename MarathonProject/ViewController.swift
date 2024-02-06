
import UIKit

class ViewController: UIViewController {
    
    var configuration: UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "swift")
        configuration.baseBackgroundColor = .systemBlue
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        return configuration
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        let button1 = CustomButton(configuration: configuration)
        button1.setTitle("First Button", for: .normal)
        button1.isHighlighted = false
        button1.backgroundColor = .systemGray2
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button1.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        button1.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
        
        
        let button2 = CustomButton(configuration: configuration)
        button2.setTitle("Second Medium Button", for: .normal)
        view.addSubview(button2)
        button2.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button2.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
        
        let button3 = CustomButton(configuration: configuration)
        button3.setTitle("Third", for: .normal)
        view.addSubview(button3)
        button3.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button3.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)


        [button1, button2, button3].forEach { button in
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.layer.cornerRadius = 8
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }

    @objc private func buttonReleased(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform.identity
        }
    }
    
    @objc func showModal(_ sender: UIButton) {
        buttonReleased(sender)
        let modalVC = UIViewController()
        modalVC.view.backgroundColor = .white
        present(modalVC, animated: true, completion: nil)
    }
}

class CustomButton: UIButton {
    
    override func tintColorDidChange() {
        switch tintAdjustmentMode {
        case .dimmed:
            self.setTitleColor(.systemGray3, for: .normal)
            super.tintColorDidChange()
            self.backgroundColor = .systemGray2
            self.imageView?.tintColor = .systemGray3
        default:
            self.backgroundColor = .systemBlue
            self.setTitleColor(.white, for: .normal)
            self.imageView?.tintColor = .white
            super.tintColorDidChange()
            
        }
    }
}


