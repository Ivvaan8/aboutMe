

import UIKit

final class GreetingViewController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    var user: User!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        greetingLabel.text = "Добро пожаловать, \(user.userName)! Моё имя - \(user.person.fullName)"
    }
}





