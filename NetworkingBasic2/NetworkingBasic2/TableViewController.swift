//
//  TableViewController.swift
//  NetworkingBasic2
//
//  Created by Derrick Park on 2017-10-19.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var repositories = [Repository]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.github.com/users/lighthouse-labs/repos")!
        
        GithubAPI.fetchData(url: url) { (repos) in
            self.repositories = repos
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepoTableViewCell
        let repo = repositories[indexPath.row]
        cell.setupCell(repo: repo)
        return cell
    }

}
