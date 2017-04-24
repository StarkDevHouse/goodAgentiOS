//
//  ViewController.swift
//  goodAgentiOS
//
//  Created by Junmo Kang on 21/04/2017.
//  Copyright © 2017 Kalabash Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var darkenBox: UIImageView!
    @IBOutlet weak var agentWrapper: UIScrollView!
    
    
    
    
    //MARK: Call SideBar
    @IBAction func menuButton(_ sender: UIButton) {
        if (sideMenu.frame.origin.x < 0) {
            moveMenu(Bool: true)
        } else {
            moveMenu(Bool: false)
        }
    }
    
    @IBAction func hideMenuButton(_ sender: UIButton) {
        moveMenu(Bool: false)
    }
    
    func moveMenu(Bool: Bool) {
        if (Bool == true) {
            let Xpos = sideMenu.frame.origin.x + 300
            let Ypos = sideMenu.frame.origin.y
            
            let height = sideMenu.frame.size.height
            let width = sideMenu.frame.size.width
            
            UIView.animate(withDuration: 0.3) {
                self.sideMenu.frame = CGRect(x: Xpos, y: Ypos, width: width, height: height)
            }
            UIView.animate(withDuration: 0.3) {
                self.darkenBox.isHidden = false
            }
        } else {
            let Xpos = sideMenu.frame.origin.x - 300
            let Ypos = sideMenu.frame.origin.y
            
            let height = sideMenu.frame.size.height
            let width = sideMenu.frame.size.width
            
            UIView.animate(withDuration: 0.3) {
                self.sideMenu.frame = CGRect(x: Xpos, y: Ypos, width: width, height: height)
            }
            
            UIView.animate(withDuration: 0.3) {
                self.darkenBox.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.darkenBox.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

