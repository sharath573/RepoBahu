//
//  ViewController.swift
//  Baahubali
//
//  Created by Sharath on 10/15/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    var Statestopper = 0
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self as? UITextFieldDelegate
        pwdText.delegate = self as? UITextFieldDelegate
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if Statestopper != 1 {
        let nameData = segue.destination as! TabController
        nameData.nameTexttab = nameText.text!
        }
    }
    @IBAction func StateBtn(_ sender: Any) {
    Statestopper = 1
        UserDefaults.standard.set(nameText.text, forKey: "namevalue")
        UserDefaults.standard.set(pwdText.text, forKey: "pwdvalue")
        if(self.nameText.text!.characters.count) < 4 {
            setAlert(title: "Oops!", message: "Name should have more than 3 characters.")}
        if(self.pwdText.text!.characters.count) < 4 {
            setAlert(title: "Oops!", message: "Password should have more than 3 characters.")}

    }
    @IBAction func TabBtn(_ sender: Any) {
        if(self.nameText.text!.characters.count) < 4 {
            setAlert(title: "Oops!", message: "Name should have more than 3 characters.")}
        if(self.pwdText.text!.characters.count) < 4 {
            setAlert(title: "Oops!", message: "Password should have more than 3 characters.")}
        UserDefaults.standard.set(pwdText.text, forKey: "pwdvalue")
        if nameText.text != ""{
            performSegue(withIdentifier: "name", sender: self)}
       

        
    }
    @IBAction func unwindBtn(_ sender: UIStoryboardSegue) {
        guard let returnData = sender.source as? NameController else {return}
        nameText.text = returnData.nameText2.text
        UserDefaults.standard.set(nameText.text, forKey: "namevalue")
        
    }
    
    func setAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion : nil)
        }))
        self.present(alert, animated:true, completion:nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let n = UserDefaults.standard.object(forKey: "namevalue") as? String
        { nameText.text = n }
        if let p = UserDefaults.standard.object(forKey: "pwdvalue") as? String
        { pwdText.text = p }
       
    }
    
}
