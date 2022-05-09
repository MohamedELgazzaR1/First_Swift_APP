//
//  MyTableViewController.swift
//  Day5_Assignment_Task1
//
//  Created by Mohamed Elgazzar on 2/15/22.
//  Copyright © 2022 Mohamed Elgazzar. All rights reserved.
//

import UIKit


class MyTableViewController: UITableViewController {


    var VC : ViewController!
    var array : Array<Dictionary<String,Any>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

              let url = URL(string: "https://api.androidhive.info/json/movies.json")

              let request = URLRequest(url: url!)

              let session = URLSession(configuration: .default)

              let task = session.dataTask(with: request) { (data, response, error) in
           
                  do{
             
                    self.array = try JSONSerialization.jsonObject(with: data! , options: .allowFragments) as! Array<Dictionary<String , Any>>
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                  }catch let error {
                      
                      print(error.localizedDescription)
                  }
                
              }
              task.resume()
        
        
       VC = self.storyboard?.instantiateViewController(withIdentifier: "VCId") as? ViewController
 
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
	        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

   
        cell.textLabel?.text = array[indexPath.row]["title"] as! String
       
       
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Movies"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        var temp1 = array[indexPath.row]
      
        if let n = temp1["rating"] as? NSNumber , let m = temp1["releaseYear"] as? NSNumber {
            
            VC.movie  = Movie(title: temp1["title"] as! String, rating: n.floatValue, releaseYear: m.intValue , image: temp1["image"] as! String, genre: temp1["genre"] as! [String])
        
        }
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
 
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
