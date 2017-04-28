//
//  ViewController.swift
//  goodAgentiOS
//
//  Created by Junmo Kang on 21/04/2017.
//  Copyright © 2017 Kalabash Inc. All rights reserved.
//

import UIKit
import GoogleMaps

class initialVC: UIViewController, UISearchBarDelegate {

    //MARK: - Properties  , UITableViewDelegate, UITableViewDataSource,
    

    @IBOutlet weak var searchResultTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var mapViewCtrl: GMSMapView?
    
    var searchController:UISearchController!
    var searching : Bool = false
    var originalArray = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var searchingDataArray:[String] = []
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    let HQpos = [37.5466822, 127.0501807]

    //MARK: - Action: Call SideBar
    
    @IBAction func CallSideBar(_ sender: Any) {

        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SideBarViewController")
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: false)

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: HQpos[0], longitude: HQpos[1], zoom: 15)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y:200, width: 414, height: 200), camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.accessibilityElementsHidden = false
        mapView.center = self.view.center

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: HQpos[0], longitude: HQpos[1])
        marker.title = "6G HQ"
        marker.snippet = "SeongDong"
        marker.map = mapView

        searchBar.delegate = self
        
        mapViewCtrl?.center = self.view.center
        self.view.addSubview(mapViewCtrl!)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Search Bar and Table View

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Meaning searching is on, then it's count searching array
//        if searching == true {
//            return searchingDataArray.count
//        } else {
//            return originalArray.count
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        if searching == true {
//            cell.textLabel?.text = searchingDataArray[indexPath.row]
//        } else {
//            cell.textLabel?.text = originalArray[indexPath.row]
//        }
//        
//        return cell
//    }
//
//    func searchBar(_ seachBar: UISearchBar, textDidChange searchText: String) {
//        searchingDataArray = originalArray.filter({ (text) -> Bool in
//            let tmp: NSString = text as NSString
//            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
//            return range.location != NSNotFound
//        })
//        
//        if(searchingDataArray.count == 0) {
//            searching = false
//        } else {
//            searching = true
//        }
//        self.searchResultTable.reloadData()
//    }
}
