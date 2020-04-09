//
//  TableViewController.swift
//  FirstAsignment
//
//  Created by Jovial on 2/29/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit
struct Value: Codable{
    var data: [jsonsData]
    var status: String
    
}
struct jsonsData:Codable{
       let id : String
       let employee_name:String
       let employee_salary:String
       let employee_age : String
}

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tabView: UITableView!
    
       var arrayData: Value?{
           didSet {
               DispatchQueue.main.async {
               self.tabView.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gatedata()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
     }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false

     }
    
    func gatedata()
    {
        let url = URL(string:"https://dummy.restapiexample.com/api/v1/employees")
        URLSession.shared.dataTask(with: url!){(data,responce,error) in
            if error == nil, let data = data{
                    do{
//                        print(String(data: data, encoding: .utf8) as Any)
                        self.arrayData = try JSONDecoder().decode(Value.self, from: data)
                        
                        DispatchQueue.main.async {
                           self.tabView.reloadData()
            
                        }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  arrayData?.data.count ?? 0
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell =  tabView.dequeueReusableCell(withIdentifier: "cell")  as! EmployeeTableViewCell
     if let emp = arrayData?.data[indexPath.row]{
     cell.idLbl.text = "Id : \(emp.id)"
     cell.nameLbl.text = "Name : \(emp.employee_name)"
     cell.salaryLbl.text = "Salary :\(emp.employee_salary)"
    
     }
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detail = self.storyboard?.instantiateViewController(withIdentifier: "details") as! DetailViewController
     detail.myid = "ID :\(arrayData!.data[indexPath.row].id)"
     detail.myname = "Name :\(arrayData!.data[indexPath.row].employee_name)"
     detail.mysalary = "Salary :\(arrayData!.data[indexPath.row].employee_salary)"
     detail.myage = "Age :\(arrayData!.data[indexPath.row].employee_age)"
     self.navigationController?.pushViewController(detail, animated: true)
    }

}
