//
//  ViewController.swift
//  TableViewWithSearchbar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var personArr = [Person]()
    
    var filteredPersonArr: [Person] {
        guard let searchTerm = seachTerm else {
            return personArr
        }
        let filteredArr = personArr.filter{(person) in
            return person.name.contains(searchTerm)
        }
        return filteredArr
    }
    
    var seachTerm: String? {
        didSet {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.searchBar.delegate = self
        personArr = Person.allPeople
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPersonArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = filteredPersonArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Person Cell", for: indexPath)
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.location
        return cell
    }
    
    //MARK: - Search Bar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.seachTerm = searchBar.text
        print("The User pressed search")
    }

}

