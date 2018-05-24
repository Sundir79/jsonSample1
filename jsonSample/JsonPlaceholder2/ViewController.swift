//
//  ViewController.swift
//  JsonPlaceholder2
//
//  Created by Sundir Talari on 03/04/18.
//  Copyright © 2018 Sundir Talari. All rights reserved.
//

import UIKit

class Tableviewcontroller: UITableViewController {

    var json = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://13.126.92.116:8000/admin/getCategories")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data =  data else {return}
            
            
            do {
                
let Gettingjson = try JSONSerialization.jsonObject(with: data, options: []) as![String: Any]
                print(Gettingjson)
                self.json = ((Gettingjson)["data"] as! [Any])
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch {
                
                print("json error: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! TableViewCell
        cell.LabelViewObject.text = ((json[indexPath.row]as! [String: Any])["category"] as! String)
        if let urlString =  ((json[indexPath.row] as! [String: Any])["image"] as? String){
            downloadImageFromServerURL(urlString: urlString, imageView: cell.ImageViewObject)
        }
        return cell
        
    }
    func downloadImageFromServerURL(urlString: String, imageView:UIImageView) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                let image = UIImage(data: data!)
                DispatchQueue.main.async(execute: { () -> Void in
                    imageView.image = image
                })
            }else{
                print("Error Downloading Image")
            }
        }).resume()

    }


}

