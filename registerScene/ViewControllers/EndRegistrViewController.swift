

import UIKit

final class EndRegistrViewController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.gradientBackground()
        greetingLabel.text = "Welcome, \(user)"
    }
}




extension UIView {
    func gradientBackground() {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [UIColor.purple.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor]
        layer.startPoint = CGPoint(x: 1, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(layer, at: 0)
        
    }
    
    
}
