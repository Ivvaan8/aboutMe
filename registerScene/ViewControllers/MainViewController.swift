

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let user = User.getInfoForUser()

    

    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 7
        passwordTF.delegate = self
        userNameTF.delegate = self
        userNameTF.text = user.userName
        passwordTF.text = user.userPassword


    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registerTabBarVC = segue.destination as? EntranceTabBarController else { return }
        guard let viewContollers = registerTabBarVC.viewControllers else { return }
        viewContollers.forEach { viewController in
            if let firsVC = viewController as? GreetingViewController {
                firsVC.user = user.userName
                firsVC.personFullName = user.person.fullName
            } else if let navigationVC = viewController as? UINavigationController {
                guard let descriptionVC =  navigationVC.topViewController as? PersonDescriptionVC else { return }
                descriptionVC.name = user.person.name
                descriptionVC.surname = user.person.surname
                descriptionVC.dateOfBirth = user.person.dateOfbirth
                descriptionVC.nationality = user.person.counry.nationality
                descriptionVC.placeOfBirth = user.person.counry.place
                descriptionVC.fullName = user.person.fullName
            }
        }

    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func userHelpButton(_ sender: UIButton) {
        sender.tag == 0
        ? createAlert(title: "Help", message: "Your name is \(user.userName)")
        : createAlert(title: "Help", message: "Your password is \(user.userPassword)")
    }
    



    
    
    @IBAction func loginButtonAction() {
        if userNameTF.text != user.userName || passwordTF.text != user.userPassword {
            createAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
        } else {
            performSegue(withIdentifier: "welcomeScreen", sender: nil)
        }
    }
}



// MARK: - Create Alert Controller

extension MainViewController {
    private func createAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


// MARK: TEXTFIELD DELEGATE
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}




