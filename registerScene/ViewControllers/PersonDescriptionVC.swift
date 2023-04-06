

import UIKit

final class PersonDescriptionVC: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    var user: User?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        title = user?.person.fullName
        navigationItem.backButtonTitle = "Back"

    }
    //MARK: - Private Functions
    
    private func configureLabels() {
        nameLabel.text = user?.person.name
        surnameLabel.text = user?.person.surname
        dateOfBirthLabel.text = user?.person.dateOfbirth
        placeOfBirthLabel.text = user?.person.counry.place
        nationalityLabel.text = user?.person.counry.nationality
    }
}
