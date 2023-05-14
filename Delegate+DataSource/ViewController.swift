//
//  ViewController.swift
//  Delegate+DataSource
//
//  Created by Nazar Kopeika on 14.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { /* 6 2 protocols */
    
    private let table: UITableView = { /* 1 */
       let table = UITableView() /* 2 */
        table.register(CustomTableViewCell.self, /* 31 change UITableViewCell */
                       forCellReuseIdentifier: CustomTableViewCell.identifier) /* 4 */ /* 32 change "cell" */
        return table /* 3 */
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table) /* 5 */
        table.delegate = self /* 7 */
        table.dataSource = self /* 8 */
        
    }
    
    override func viewDidLayoutSubviews() { /* 14 */
        super.viewDidLayoutSubviews() /* 15 */
        table.frame = view.bounds /* 16 */
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { /* 9 */
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /* 10 */
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell /* 11 */ /* 33  change "cell" and add as! */
//        cell.textLabel?.text = "Hello" /* 12 */
        cell.delegate = self /* 38 */
        cell.configure(with: "Cell: \(indexPath.row)") /* 50 */
        return cell /* 13 */
    }
}

extension ViewController: CustomTableViewCellDelegate { /* 39 */
    func didTapButton(with string: String) { /* 40 */ /* 49 add with */
        print("vc received tap from button \(string)") /* 41 */
    }
}
