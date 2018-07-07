//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//

import UIKit

class RouterColorViewController: UIViewController {
    
    var color: UIColor?
    
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        closeButton.isHidden = presentingViewController == nil
    }

    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
