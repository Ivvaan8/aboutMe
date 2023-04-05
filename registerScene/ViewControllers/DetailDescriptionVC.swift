
import UIKit

final class DetailDescriptionVC: UIViewController {

    @IBOutlet weak var biographyTF: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func scrollButtonAction() {
        biographyTF.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }
    
 

}
