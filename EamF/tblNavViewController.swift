//
//  tblNavViewController.swift
//  EamF
//
//  Created by RLogixxTraining on 16/08/23.
//

import UIKit

class tblNavViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
  
    var emparr = [[String:Any]]()
    
    @IBOutlet weak var tblEmp: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print(emparr)
        self.tblEmp.delegate = self
        self.tblEmp.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emparr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableViewCell")
        //let dataemp = emparr
        cell.textLabel?.text = self.emparr[indexPath.row]["name"] as? String
        cell.detailTextLabel?.text = self.emparr[indexPath.row]["address"] as? String
        cell.backgroundColor = .red
        let data = emparr[indexPath.row]["image"] as! String
        cell.imageView?.image = convertBase64StringToImage(imageBase64String: data)
       // cell.accessoryType
       // cell.imageView?.image = UIImage(named: emparr[indexPath.row]["image"] as! String)
        return cell
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data(base64Encoded: imageBase64String)
        let image = UIImage(data: imageData!)
        return image!
    }

   
}
