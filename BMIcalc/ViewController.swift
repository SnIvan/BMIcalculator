// ViewController.swift
//
// Author: Ivan Sakhan
// stud id: 301006637
// 13.12.2018
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var switchModeButton: UIButton!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bmiLabel.isHidden = true
        self.conditionLabel.isHidden = true
        self.heightSlider.isHidden = true
        self.weightSlider.isHidden = true
        self.heightValueLabel.isHidden = true
        self.weightValueLabel.isHidden = true
        self.heightValueLabel.text = "22.0"
        self.weightValueLabel.text = "4.7"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        var height:Double?
        var weight:Double?
        
        if(self.heightField.isHidden) {
            height = Double(self.heightSlider.value)
            weight = Double(self.weightSlider.value)
            
            self.heightValueLabel.text = String(format: "%.1f", height!)
            self.weightValueLabel.text = String(format: "%.1f", weight!)
        }
        else {
            height = Double(self.heightField.text!)
            weight = Double(self.weightField.text!)
        }
        
        if height != nil && weight != nil {
            let bmi = 703 * weight!/(height! * height!)
            
            self.bmiLabel.text = String(format: "%.7f", bmi)
            
            switch bmi {
            case _ where bmi < 16:
                self.conditionLabel.text = "You have Severe Thinness"
                self.conditionLabel.textColor = UIColor.blue
            case _ where bmi >= 16 && bmi < 17:
                self.conditionLabel.text = "You have Moderate Thinness"
                self.conditionLabel.textColor = UIColor.green
            case _ where bmi >= 17 && bmi < 18.5:
                self.conditionLabel.text = "You have Mild Thinness"
                self.conditionLabel.textColor = UIColor.purple
            case _ where bmi >= 18.5 && bmi < 25:
                self.conditionLabel.text = "You have Normal"
                self.conditionLabel.textColor = UIColor.black
            case _ where bmi >= 25 && bmi < 30:
                self.conditionLabel.text = "You have Overweight"
                self.conditionLabel.textColor = UIColor.orange
            case _ where bmi >= 30 && bmi < 35:
                self.conditionLabel.text = "You have Obese Class 1"
                self.conditionLabel.textColor = UIColor.green
            case _ where bmi >= 35 && bmi < 40:
                self.conditionLabel.text = "You have Obese Class 2"
                self.conditionLabel.textColor = UIColor.yellow
            default:
                self.conditionLabel.text = "You have Obese Class 3"
                self.conditionLabel.textColor = UIColor.red
            }
            
            self.bmiLabel.isHidden = false
            self.conditionLabel.isHidden = false
        }
        else {
            self.conditionLabel.text = "Error field"
            self.conditionLabel.textColor = UIColor.red
            self.conditionLabel.isHidden = false
        }
    }
    
    @IBAction func resetBMI(_ sender: UIButton?) {
        self.heightField.text = ""
        self.weightField.text = ""
        self.bmiLabel.text = ""
        self.conditionLabel.text = ""
        
        self.bmiLabel.isHidden = true
        self.conditionLabel.isHidden = true
    }
    
}

