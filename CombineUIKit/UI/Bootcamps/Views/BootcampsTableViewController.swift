//
//  BootcampsTableViewController.swift
//  CombineUIKit
//
//  Created by Roberto Rojo Sahuquillo on 3/11/22.
//

import UIKit
import Combine

class BootcampsTableViewController: UITableViewController {
    
    private var viewModel = BootcampsViewModel()
    
    private var subscriber = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Create subscriber
        viewModel.$bootcamps
            .sink { data in
                //What do you want to do with the data? here
                DispatchQueue.main.async{
                    self.tableView.reloadData() //Reload UI data in main thread
                }
            }
            .store(in: &subscriber)
        
        //Call loadData
        viewModel.loadBotcamps()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.bootcamps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = self.viewModel.bootcamps[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
}
