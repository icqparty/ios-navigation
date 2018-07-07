//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//

import UIKit

class RouterViewController: UITableViewController {
    
    private struct Section {
        let title: String
        let transition: Transition
        let cellReuseIdentifier: String
        let cells: [(title: String, color: UIColor)]
    }
    
    private let sections: [Section] = [
        .init(title: "Push",
              transition: .push(RouterScene.colorViewController),
              cellReuseIdentifier: "PushCell",
              cells: [("Push red controller", .red),
                      ("Push green controller", .green),
                      ("Push blue controller", .blue)]),
        .init(title: "Present",
              transition: .present(RouterScene.colorViewController),
              cellReuseIdentifier: "PresentCell",
              cells: [("Present red controller", .red),
                      ("Present green controller", .green),
                      ("Present blue controller", .blue)])
    ]
    
    private var router: Router?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Router navigation"
        guard let navigationController = navigationController else { return }
        router = AppRouter(root: navigationController)
    }
}

// MARK: - Table view delegate
extension RouterViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        router?.perorm(transition: section.transition) {
            ($0 as? RouterColorViewController)?.title = section.title
            ($0 as? RouterColorViewController)?.color = section.cells[indexPath.row].color
        }
    }
}

// MARK: - Table view data source
extension RouterViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sections[indexPath.section].cellReuseIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].cells[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}
