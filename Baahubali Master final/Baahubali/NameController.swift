//
//  NameController.swift
//  Baahubali
//
//  Created by Sharath on 10/15/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit

class NameController: UIViewController {
    @IBOutlet weak var nameText2: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbarText = tabBarController as! TabController
        nameText2.text = String(describing: tabbarText.nameTexttab)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
