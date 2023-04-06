

import UIKit

final class PersonDescriptionVC: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    var name = ""
    var surname = ""
    var dateOfBirth = ""
    var placeOfBirth = ""
    var nationality = ""
    var fullName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        title = fullName
        navigationItem.backButtonTitle = "Back"

    }
    //MARK: - Private Functions
    
    private func configureLabels() {
        nameLabel.text = name
        surnameLabel.text = surname
        dateOfBirthLabel.text = dateOfBirth
        placeOfBirthLabel.text = placeOfBirth
        nationalityLabel.text = nationality
    }
}
