
import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSquareView()
    }

    private func configureSquareView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 10
        squareView.layer.insertSublayer(gradientLayer, at: 0)
        
        squareView.layer.shadowColor = UIColor.black.cgColor
        squareView.layer.shadowOffset = CGSize(width: 0, height: 4)
        squareView.layer.shadowOpacity = 0.5
        squareView.layer.shadowRadius = 4
        squareView.layer.masksToBounds = false
        squareView.layer.cornerRadius = 10
    }
}

