//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//
import UIKit

enum RouterScene: String, Scene {
    case colorViewController = "RouterColorViewController"
}

extension RouterScene {
    private var storyboard: UIStoryboard {
        return UIStoryboard(name: "RouterNavigation", bundle: nil)
    }

    var viewController: UIViewController {
        switch self {
        case .colorViewController:
            return storyboard.instantiateViewController(withIdentifier: self.rawValue)
        }
    }
}
