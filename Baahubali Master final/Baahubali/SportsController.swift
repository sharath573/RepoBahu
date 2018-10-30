//
//  SportsController.swift
//  Baahubali
//
//  Created by Sharath on 10/15/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit

class SportsController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var pickerView: UIPickerView!
    let countries = ["India","USA","Taiwan"]
    let IndiaG = ["Cricket", "Chess", "Badminton", "Field Hockey", "Football", "Tennis", "Gilli-danda", "Golf"]
    let USAG = ["Baseball", "Football", "Curling", "Basketball", "Soccer","Football", "Rock Climbing", "Skateboarding"]
    let TaiwanG = ["Football", "Archery", "Baseball", "Table Tennis", "Archery","Football","Cycling", "Taekwondo"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 //rows
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {

            return countries[row]
        }
        if pickerView.selectedRow(inComponent: 0) == 0 {
            
            return IndiaG[row]
        }
        if pickerView.selectedRow(inComponent: 0) == 1 {
           
            return USAG[row]
        }
        if pickerView.selectedRow(inComponent: 0) == 2 {
            
            return TaiwanG[row]
        }
        
        return countries[row]
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var countryName = countries[pickerView.selectedRow(inComponent: 0)]
        var gameA = IndiaG[pickerView.selectedRow(inComponent: 1)]
        var gameB = USAG[pickerView.selectedRow(inComponent: 1)]
        var gameC = TaiwanG[pickerView.selectedRow(inComponent: 1)]
        if component == 0 {
            countryName = countries[row]
            pickerView.reloadAllComponents()
        }
        if component == 1 {
            if countryName == "India"{
            gameA = IndiaG[row]
            setAlert(title: "Country:"+countryName, message: "Selected Game:"+gameA)
            }
            if countryName == "USA"{
                gameB = USAG[row]
                if gameB != ""{
                setAlert(title: "Country:"+countryName, message: "Selected Game:"+gameB)
                }
            }
            if countryName == "Taiwan"{
                gameC = TaiwanG[row]
                if gameC != "" {
                setAlert(title: "Country:"+countryName, message: "Selected Game:"+gameC)
                }
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
        if component == 0 {
            return countries.count
        }
        return 8
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.dataSource = self //countries[1]
        pickerView.delegate = self
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
