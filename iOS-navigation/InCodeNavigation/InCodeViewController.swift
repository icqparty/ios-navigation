//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//

import UIKit

class InCodeViewController: UITableViewController {
    
    private struct Section {
        let title: String
        let transition: Transition
        let cellReuseIdentifier: String
        let cells: [(title: String, color: UIColor)]
        
        enum Transition {
            case push
            case present
        }
    }
    
    private let sections: [Section] = [
        .init(title: "Push",
              transition: .push,
              cellReuseIdentifier: "PushCell",
              cells: [("Push red controller", .red),
                      ("Push green controller", .green),
                      ("Push blue controller", .blue)]),
        .init(title: "Present",
              transition: .present,
              cellReuseIdentifier: "PresentCell",
              cells: [("Present red controller", .red),
                      ("Present green controller", .green),
                      ("Present blue controller", .blue)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "InCode navigation"
    }
}

// MARK: - Table view delegate
extension InCodeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inCodeStoryboard = UIStoryboard(name: "InCodeNavigation", bundle: nil)
        guard let viewController = inCodeStoryboard.instantiateViewController(withIdentifier: "InCodeColorViewController") as? InCodeColorViewController else {
                return
        }
        let section = sections[indexPath.section]
        viewController.title = section.title
        viewController.color = section.cells[indexPath.row].color
        
        switch section.transition {
        case .push:
            navigationController?.pushViewController(viewController, animated: true)
        case .present:
            present(viewController, animated: true, completion: nil)
        }
    }
}

// MARK: - Table view data source
extension InCodeViewController {
    
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
