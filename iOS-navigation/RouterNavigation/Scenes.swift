//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//
import UIKit

typealias Configuration<T> = (_ viewController: T) -> ()

enum RouterScene: Scene {
    case colorViewController(Configuration<RouterColorViewController>?)
}

extension RouterScene {
    private var storyboard: UIStoryboard {
        return UIStoryboard(name: "RouterNavigation", bundle: nil)
    }
    
    private var name: String {
        switch self {
        case .colorViewController:
            return "RouterColorViewController"
        }
    }

    var viewController: UIViewController {
        switch self {
        case .colorViewController(let config):
            let vc = storyboard.instantiateViewController(withIdentifier: self.name) as! RouterColorViewController
            config?(vc)
            return vc
        }
    }
}
