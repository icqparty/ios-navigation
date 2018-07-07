//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//

import UIKit

protocol Router {
    func perorm(transition: Transition, to: () -> Scene)
}

enum Transition {
    case push
    case present
}

protocol Scene {
    var viewController: UIViewController { get }
}

struct AppRouter: Router {
    private let root: UINavigationController
    
    init(root: UINavigationController) {
        self.root = root
    }
    
    func perorm(transition: Transition, to: () -> Scene) {
        switch transition {
        case .push:
            root.pushViewController(to().viewController, animated: true)
        case .present:
            root.present(to().viewController, animated: true, completion: nil)
        }
    }
}
