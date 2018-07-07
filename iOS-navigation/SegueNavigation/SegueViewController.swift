//
//  Copyright © 2018 Станислав Сарычев. All rights reserved.
//

import UIKit

class SegueViewController: UITableViewController {
    
    private struct Section {
        let title: String
        let cellReuseIdentifier: String
        let cells: [(title: String, color: UIColor)]
    }
    
    private let sections: [Section] = [
        .init(title: "Push",
              cellReuseIdentifier: "PushCell",
              cells: [("Push red controller", .red),
                      ("Push green controller", .green),
                      ("Push blue controller", .blue)]),
        .init(title: "Present",
              cellReuseIdentifier: "PresentCell",
              cells: [("Present red controller", .red),
                      ("Present green controller", .green),
                      ("Present blue controller", .blue)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Segue"
    }
}

// MARK: - Navigation
extension SegueViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ColorViewController,
            let tableViewCell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: tableViewCell)else {
                return
        }
        viewController.color = sections[indexPath.section].cells[indexPath.row].color
        viewController.title = sections[indexPath.section].title
    }
}

// MARK: - Table view data source
extension SegueViewController {
    
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
