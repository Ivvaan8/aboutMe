

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let userName = "Alex"
    private let password = "1234"
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 7
        passwordTF.delegate = self
        userNameTF.delegate = self

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registerVC = segue.destination as? EndRegistrViewController else { return }
        registerVC.user = userName

    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func userHelpButton(_ sender: UIButton) {
        sender.tag == 0
        ? createAlert(title: "Help", message: "Your name is \(userName)")
        : createAlert(title: "Help", message: "Your password is \(password)")
    }
    



    
    
    @IBAction func loginButtonAction() {
        if userNameTF.text != userName || passwordTF.text != password {
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




