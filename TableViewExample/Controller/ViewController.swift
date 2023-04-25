//
//  ViewController.swift
//  TableViewExample
//
//  Created by Anil Duran on 24.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PeopleManagerDelegate {
    func didUpdatePeople(people: [Person]) {
        DispatchQueue.main.async {
            self.people = people
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    var people: [Person] = []
    var peopleManager = PeopleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        peopleManager.delegate = self
        peopleManager.performRequest()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
  

}

