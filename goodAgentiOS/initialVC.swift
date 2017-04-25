//
//  ViewController.swift
//  goodAgentiOS
//
//  Created by Junmo Kang on 21/04/2017.
//  Copyright © 2017 Kalabash Inc. All rights reserved.
//

import UIKit


class initialVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var originalArray:[String] = []
    var searchingDataArray:[String] = []
    var searching: Bool! = false
    
    

    
    
    //MARK: - Action: Call SideBar
    
    @IBAction func CallSideBar(_ sender: Any) {

        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SideBarViewController")
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalArray = ["index", "Vivo", "Micromax", "Sony", "Motorola"]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Meaning searching is on, then it's count searching array
        if searching == true {
            return searchingDataArray.count
        } else {
            return originalArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if searching == true {
            cell.textLabel?.text = searchingDataArray[indexPath.row]
        } else {
            cell.textLabel?.text = originalArray[indexPath.row]
        }
        
        return cell
    }
    
    func searchBar(_ seachBar: UISearchBar, textDidChange searchText: String) {
        searchingDataArray = originalArray.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if(searchingDataArray.count == 0) {
            searching = false
        } else {
            searching = true
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
