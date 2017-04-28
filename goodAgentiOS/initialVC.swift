//
//  ViewController.swift
//  goodAgentiOS
//
//  Created by Junmo Kang on 21/04/2017.
//  Copyright © 2017 Kalabash Inc. All rights reserved.
//

import UIKit
import GoogleMaps

class initialVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet weak var map: UIView!

    
    
    var searchController:UISearchController!
    var searchActive : Bool = false
    var data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var filtered:[String] = []
    let HQpos = [37.5466822, 127.0501807]

    //MARK: - Action: Call SideBar
    
    @IBAction func CallSideBar(_ sender: Any) {

        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SideBarViewController")
        // uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: false)

    }

    //MARK: - Load GoogleMap
    
    override func loadView() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
//        self.searchBar = UISearchBar(frame: CGRect.init(x: 15, y: 20, width: 250, height: 44))
//        self.searchBar.delegate = self
//        
        
//        tableView.delegate = self
//        tableView.delegate = self
//        tableView.dataSource = self
//        
        
        let camera = GMSCameraPosition.camera(withLatitude: HQpos[0], longitude: HQpos[1], zoom: 15)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.accessibilityElementsHidden = false
        
        // self.view = mapView
        // self.map = mapView
//
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: HQpos[0], longitude: HQpos[1])
//        marker.title = "6G HQ"
//        marker.snippet = "SeongDong"
//        marker.map = mapView
        
        
        // Setup delegates
//        if (tableView != nil) {
//            
//        }
        
        
        // self.view.addSubview(searchBar)
        //self.searchBar.layer.cornerRadius = 0
        
//        if (searchBar != nil) {
//            
//
//        } else {
//            print("no search bar")
//        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - search Ctrl.
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.delegate = self
    }
    
    
    // MARK: - Search Bar and Table View

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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if (filtered.count == 0) {
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if(searchActive) {
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    

}
