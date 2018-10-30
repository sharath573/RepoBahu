//
//  StateController.swift
//  Baahubali
//
//  Created by Sharath on 10/15/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit

class StateController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableStateview: UITableView!
    
    var statedata = [String]()
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statecell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "statecell" )
        statecell.textLabel?.text = statedata[indexPath.row]
        return statecell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   let selectedState = statedata[indexPath.row]
        //setAlert(title: "Oops!", message: selectedState)
        let vc = storyboard?.instantiateViewController(withIdentifier: "StatedetailController") as? StatedetailController
        vc?.stateRname = statedata[indexPath.row]
        vc?.namenum = indexPath.row
        self.navigationController?.pushViewController(vc! , animated: true )
    }
    var myString = String()
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let plistPath:String? = Bundle.main.path(forResource: "StatesList", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: plistPath!)
        statedata = dict!.object(forKey: "States") as! [String]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion : nil)
        }))
        self.present(alert, animated:true, completion:nil)
    }
    
}
