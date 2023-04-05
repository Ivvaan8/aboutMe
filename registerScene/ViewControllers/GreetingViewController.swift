

import UIKit

final class GreetingViewController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    var user = ""
    var personFullName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        greetingLabel.text = "Добро пожаловать, \(user)! Моё имя - \(personFullName)"
    }
}





