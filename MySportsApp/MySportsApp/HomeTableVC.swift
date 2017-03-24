//
//  HomeTableVC.swift
//  MySportsApp
//
//  Created by Matthew Trahan on 3/24/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

import UIKit

class HomeTableVC: UITableViewController {
    
    var games: NSArray? = nil
    var rocketsGames: NSArray? = nil
    let sports: [String] = ["nba", "mlb", "nfl"]
    let data: [String] = ["scoreboard"]
    let seasonName: String = "current"
    let format: String = "json"
    var date: Date?
    let auth: String = "mtrahan:mysportsfeeds".toBase64()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // format for date
        date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "YYYYMMdd"
        let forDate = formatter.string(from: date!)
        

        loadData(forDate: forDate)
    }
    
    func loadData(forDate: String) {
        var urlPath = "https://www.mysportsfeeds.com/api/feed/pull/"
        urlPath += sports[0] + "/"
        urlPath += seasonName + "/"
        urlPath += data[0] + "." + format + "?"
        urlPath += "fordate=" + forDate
        
        let url: URL? = URL(string: urlPath)
        
        if (url == nil) {
            print("url is nil. Can't initiate request.")
            return
        }
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Basic \(auth)", forHTTPHeaderField: "Authorization")
        
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            print("Data get returned")
            if error != nil {
                print("Error returned from request: " + error!.localizedDescription)
            } else {
                print(response!)
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    if jsonResult != nil {
                        if let results: NSDictionary = jsonResult!["scoreboard"] as? NSDictionary {
                            self.games = results["gameScore"] as? NSArray
                            for game in self.games! {
                                print(game["ID"])
                            }
                            if self.games != nil {
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            } else {
                                print("'weather' element not found in returned payload")
                            }
                        }
                    }
                } catch {
                    print("Error parsing the payload returned")
                }
            }
        }) 
        task.resume() // start the request
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sports.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        return cell
    }

}
