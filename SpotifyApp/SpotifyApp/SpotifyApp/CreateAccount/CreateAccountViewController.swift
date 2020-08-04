//
//  CreateAccountViewController.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class CreateAccountViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.backgroundColor = .blue

        return cell
    }

}
