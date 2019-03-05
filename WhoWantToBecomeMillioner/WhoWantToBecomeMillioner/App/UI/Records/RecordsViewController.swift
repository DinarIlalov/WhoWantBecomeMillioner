//
//  RecordsViewController.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let recordsDataSource: [Record] = Game.shared.records
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}

extension RecordsViewController: UITableViewDelegate {
    
}

extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let record = recordsDataSource[indexPath.row]
        
        cell.textLabel?.text = record.score.description
        cell.detailTextLabel?.text = record.date.description
        
        return cell
        
    }
    
}
