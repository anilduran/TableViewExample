//
//  PeopleController.swift
//  TableViewExample
//
//  Created by Anil Duran on 24.04.2023.
//

import Foundation

protocol PeopleManagerDelegate {
    
    func didUpdatePeople(people: [Person])
    
}

class PeopleManager {
    var delegate: PeopleManagerDelegate?
    
    func performRequest() {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    print(error)
                }

                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let people = try decoder.decode([Person].self, from: data)
                        self.delegate?.didUpdatePeople(people: people)
                    } catch {
                        print(error)
                    }
                }
                 
            }
            
            task.resume()
            
        }
        
        
        
    }
}
