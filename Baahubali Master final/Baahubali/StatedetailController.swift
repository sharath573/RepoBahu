//
//  StatedetailController.swift
//  Baahubali
//
//  Created by Sharath on 10/25/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit

class StatedetailController: UIViewController {

    @IBOutlet weak var statenamelbl: UILabel!
    
    @IBOutlet weak var cap: UILabel!
    @IBOutlet weak var abbr: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    let nameA = ["ALABAMA","ALASKA","ARIZONA","ARKANSAS","CALIFORNIA","COLORADO","CONNECTICUT","DELAWARE","FLORIDA","GEORGIA"]
    let AbbrA = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA"]
    let capA = ["Montgomery","Juneau","Pheonix","Little Rock","Sacramento","Denver","Hartford","Dover","Tallahassee","Atlanta"]
    let dateA = ["December 14, 1819",
                 "January 3, 1959",
                 "February 14, 1912",
                 "June 15, 1836",
                 "September 9, 1850",
                 "August 1, 1876",
                 "January 9, 1788",
                 "December 7, 1787",
                 "March 3, 1845",
                 "January 2, 1788"]
    
    
    
    
    
    var stateRname = ""
    var namenum = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
    statenamelbl.text = stateRname
        
        
        abbr.text = AbbrA[namenum]
        cap.text = capA[namenum]
        date.text = dateA[namenum]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
