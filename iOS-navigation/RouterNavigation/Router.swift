//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//

import UIKit

protocol Router {
    func perorm(transition: Transition, config: Configuration?)
}

enum Transition {
    case push(Scene)
    case present(Scene)
}

protocol Scene {
    var viewController: UIViewController { get }
}

typealias Configuration = (_ viewController: UIViewController) -> Void

struct AppRouter: Router {
    private let root: UINavigationController
    
    init(root: UINavigationController) {
        self.root = root
    }
    
    func perorm(transition: Transition, config: Configuration? = nil) {
        switch transition {
        case .push(let scene):
            let viewController = scene.viewController
            config?(viewController)
            root.pushViewController(viewController, animated: true)
        case .present(let scene):
            let viewController = scene.viewController
            config?(viewController)
            root.present(viewController, animated: true, completion: nil)
        }
    }
}
