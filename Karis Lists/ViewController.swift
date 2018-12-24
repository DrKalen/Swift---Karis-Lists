//
//  ViewController.swift
//  Karis Lists
//
//  Created by Kalen Hammann on 12/24/18.
//  Copyright © 2018 Human Family. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var data: [String] = ["One", "Two", "Three"]
    
    override func viewDidAppear(_ animated: Bool) {
        let dataObject = UserDefaults.standard.object(forKey: "data")
//        data = dataObject as? [String] ?? [String]()
//        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            data.remove(at: indexPath.row)
            UserDefaults.standard.set(data, forKey: "data")
            table.reloadData()
        }
    }



}

