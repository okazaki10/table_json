//
//  ViewController.swift
//  table_json
//
//  Created by Rakha A on 15/06/22.
//

import UIKit

class ViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    var result:[Result?] = []
        
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        parse()
        // Do any additional setup after loading the view.
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
  
    }

    func parse(){
        guard let path = Bundle.main.path(forResource: "books", ofType: "json")else{
            return
        }
        let url = URL(fileURLWithPath:path)
        
        do{
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode([Result?].self,from:jsonData)
            print(result)
            print("success")
        }catch{
            print("error \(error)")
        }
        
    }

    
    // Data model: These strings will be the data for the table view cells
 
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTable",for: indexPath) as! ListTable
        
        // set the text from the data model
        cell.title?.text = self.result[indexPath.row]?.title
        cell.author?.text = self.result[indexPath.row]?.author
        cell.year?.text = String(self.result[indexPath.row]?.year ?? 0)
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
}

