//
//  databaseHelper.swift
//  FirstAsignment
//
//  Created by Jovial on 2/29/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
//
       static var shareIntance = DatabaseHelper()
       let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
      func save(object:[String:String]) throws
      {
      let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as! Employee
//        let employee = Employee(context: context!)
        employee.name = object["name"]
        employee.email = object["email"]
        employee.password = object["password"]
        employee.phone = object["phone"]
        do {
            try context?.save()
            print("data is save")
        }
        catch {
            throw error
        }
    }
    
    func gateData() -> [Employee]?
    {
        var employee = [Employee]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Employee")
       fetchRequest.returnsObjectsAsFaults = false

        do{
            employee = try context?.fetch(fetchRequest) as! [Employee]
            return employee
        }
        catch
        {
            print("can not fetch data ")
        }
        return nil
  }
     
}
