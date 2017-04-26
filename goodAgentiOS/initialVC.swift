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
    
    var data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var searchActive: Bool! = false
    var filtered:[String] = []
    
    //MARK: - Action: Call SideBar
    
    @IBAction func CallSideBar(_ sender: Any) {

        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SideBarViewController")
        // uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: false)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup delegates
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table View from data source

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filtered[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = searchText.isEmpty ? data: data.filter{(item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
    }




}
