//
//  ViewController.swift
//  QuickBudget
//
//  Created by Thomas Karg on 19.11.16.
//  Copyright © 2016 Thomas Karg. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var selectDateButton: DropDownButton!
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var datePickerView: UIView!
    
    
    struct DateTexts {
        let date: Date
        let datetext: String
        
        init(date: Date, datetext: String){
            self.date = date
            self.datetext = datetext
        }
    }
    
    var thisDate = Date()
    
    var pickerDataSource = [DateTexts(date: Date(), datetext: "Today")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.dataSource = self;
        self.datePicker.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
        createButtons()
        setDate()
        selectDateButton.setTitle(self.pickerDataSource[0].datetext, for: UIControlState())
        self.view.bringSubview(toFront: datePickerView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButtons(){
        
        var i = 0
        var x: CGFloat = 18
        var y: CGFloat = 375
        
        let shortAdds = DatabaseModelController.getShortItems()
        
        for item in shortAdds {
            let box:ShortAddButton = ShortAddButton(frame: CGRect(x: x, y: y, width: 111, height: 48), labelMsg1: String(format:"%.2f", item.price), labelMsg2: (item.category?.name)!)
            box.tag = i
            box.addTarget(self, action: #selector(ViewController.boxButtonReleased(_:)), for: UIControlEvents.touchUpInside)
            box.addTarget(self, action: #selector(ViewController.boxButtonPressed(_:)), for: UIControlEvents.touchDown)
            self.view.addSubview(box)
            
            i += 1
            x = x + 114
            let rest = i % 3
            if rest == 0 {
                x = 18
                y = y + 105
            }
            
        }
    }
    
    func setDate() {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        var dateToAdd: DateTexts
        
        for i in 1...7 {
            let daysToRemove = -i
            var newDateComponents = DateComponents()
            newDateComponents.day = daysToRemove
            let calculatedDate = (Calendar.current as NSCalendar).date(byAdding: newDateComponents, to: currentDate, options: NSCalendar.Options.init(rawValue: 0))
            if i==1 {
                dateToAdd = DateTexts(date: calculatedDate!, datetext: "Yesterday")
            } else {
                let convertedDate = dateFormatter.string(from: calculatedDate!)
                dateToAdd = DateTexts(date: calculatedDate!, datetext: convertedDate)
                
            }
            pickerDataSource.append(dateToAdd)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row].datetext
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectDateButton.setTitle(self.pickerDataSource[row].datetext, for: UIControlState())
    }
    
    func boxButtonPressed(_ sender:ShortAddButton!) {
        
        sender.setTextColor(UIColor.lightGray)
    }
    
    func boxButtonReleased(_ sender:ShortAddButton!) {
        
        sender.setTextColor(UIColor(red:0.14, green:0.62, blue:0.52, alpha:1.0))
        priceLabel.text = sender.label1.text
    }
    
    @IBAction func clearPrice(_ sender: Any) {
        DatabaseModelController.clearCoreData()
    }
    
    @IBAction func selectDate(_ sender: Any) {
        datePickerView.isHidden = false
    }
    
    @IBAction func closeDatePicker(_ sender: Any) {
        datePickerView.isHidden = true
    }
}

