//
//  PeopleTableViewController.swift
//  TableViewWithSearchbar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController, UISearchBarDelegate {
    var personArr = [Person]()

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        personArr = Person.allPeople
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Person Cell - TVC", for: indexPath)
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.dob
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("The User pressed search")
    }
    
    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
