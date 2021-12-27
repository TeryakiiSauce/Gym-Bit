//
//  CustomUITableView.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 26/12/2021.
//

import UIKit

class CustomUITableView: UITableView {
    
    var myArray = ["1","2","3"]

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("Num: \(indexPath.row)")
           print("Value: \(myArray[indexPath.row])")
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return myArray.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
           cell.textLabel!.text = "\(myArray[indexPath.row])"
           return cell
       }
    
    
}
