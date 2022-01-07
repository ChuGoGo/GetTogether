//
//  ViewController.swift
//  GetTogether
//
//  Created by Chu Go-Go on 2022/1/5.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var foodServeSlider: UISlider!
    @IBOutlet weak var foodServeLabel: UILabel!
    @IBOutlet weak var serveSlider: UISlider!
    @IBOutlet weak var severLabel: UILabel!
    @IBOutlet weak var cleanSlider: UISlider!
    @IBOutlet weak var cleanLabel: UILabel!
    @IBOutlet weak var comeBackSwitch: UISwitch!
    @IBOutlet weak var comeBackLabel: UILabel!
    @IBOutlet weak var goodServePersonTextFeild: UITextField!
    @IBOutlet weak var needToChangeTextField: UITextField!
    @IBOutlet weak var giveBackLabel: UILabel!
//定義SegmentedControl知道他跑出來的值判斷是男性還女性。
    var genderIndex : Int = 0
//    定義他們的年齡，如果想要進階的話可以畫分年齡層。
    var age : Int = 0
//    評分餐點的滿意度
    var foodSever : Int = 0
//    評分服務態度
    var server : Int = 0
//    評分環境清潔度
    var clean : Int = 0
//    寫出一個func可以讓上面定義的變數產生出他們相對的值
    func customerValue() {
//        用slider操控
        age = Int(ageSlider.value)
//        跑出他的值
        ageLabel.text = "\(age)"
        foodSever = Int(foodServeSlider.value)
        foodServeLabel.text = "\(foodSever)"
        server  = Int(serveSlider.value)
        severLabel.text = "\(server)"
        clean = Int(cleanSlider.value)
        cleanLabel.text = "\(clean)"
//        判斷SegmentedControl是男生還是女生
        genderIndex = genderSegmentedControl.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func genderChange(_ sender: Any) {
        //        判斷SegmentedControl是男生還是女生
        genderIndex = genderSegmentedControl.selectedSegmentIndex
        
    }
    
    @IBAction func ageChangeSlider(_ sender: UISlider) {
        customerValue()
    }
    
    @IBAction func comeBackSwitch(_ sender: UISwitch) {
//        如果開關打開的話，顯示是
        if sender.isOn {
            comeBackLabel.text = "是"
        } else {
//            如果開關閉起來的話顯示否
            comeBackLabel.text = "否"
        }
    }
    

    @IBAction func SentButton(_ sender: Any) {
        customerValue()
//        判斷Index是0還是1
        genderIndex = genderSegmentedControl.selectedSegmentIndex
//        算出Slider的值總和
        let customertotal = foodSever + server + clean
//        如果評分>11，genderIndex得直為0時
        if customertotal > 11 , genderIndex == 0 {
            giveBackLabel.text = "謝謝\(String(nameTextfield.text!))先生及肯定！期待您再來用餐！也謝謝您喜歡今日的服務人員\(String(goodServePersonTextFeild.text!))，我們將會對\(String(needToChangeTextField.text!))做改進。"
        } //如果11<=評分>=7,genderIndex得直為0時
        else if customertotal <= 11, customertotal >= 7, genderIndex == 0 {
            giveBackLabel.text = "謝謝\(String(nameTextfield.text!))先生的評價我們會儘速改進我們的缺點，希望您再度光臨！\n也謝謝您喜歡今日的服務人員\(String(goodServePersonTextFeild.text!))，我們將會對\(String(needToChangeTextField.text!))做改進。"
        } //如果評分<7,genderIndex得直為0時
        else if customertotal < 7 , genderIndex == 0 {
            giveBackLabel.text = "不好意思讓\(String(nameTextfield.text!))有不愉快的用餐體驗，我們會好好反省。希望您能夠再來體驗看見我們的改變。\n也謝謝您喜歡今日的服務人員\(String(goodServePersonTextFeild.text!))，我們將會對\(String(needToChangeTextField.text!))做改進。"
        }//        如果評分>11，genderIndex得直為1時
        else if customertotal > 11 , genderIndex == 1 {
            giveBackLabel.text = "謝謝\(String(nameTextfield.text!))女士及肯定！期待您再來用餐！也謝謝您喜歡今日的服務人員\(String(goodServePersonTextFeild.text!))。"
        }//如果11<=評分>=7,genderIndex得直為1時
        else if customertotal <= 11, customertotal >= 7, genderIndex == 1 {
            giveBackLabel.text = "謝謝\(String(nameTextfield.text!))小姐的評價我們會儘速改進我們的缺點，希望您再度光臨！\n也謝謝您喜歡今日的服務人員\(String(goodServePersonTextFeild.text!))，我們將會對\(String(needToChangeTextField.text!))做改進。"
        } //如果評分<7,genderIndex得直為1時
        else if customertotal < 7 , genderIndex == 1 {
            giveBackLabel.text = "不好意思讓\(String(nameTextfield.text!))小姐有不愉快的用餐體驗，我們會好好反省。希望您能夠再來體驗看見我們的改變。\n也謝謝您喜歡今日的服務人員\(String(goodServePersonTextFeild.text!))，我們將會對\(String(needToChangeTextField.text!))做改進。"
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
//        字為空值
        nameTextfield.text = ""
        goodServePersonTextFeild.text = ""
        needToChangeTextField.text = ""
//        slider為0
        ageSlider.value = 0
//        text顯示為0
        ageLabel.text = "0"
        serveSlider.value = 0
        severLabel.text = "0"
        foodServeSlider.value = 0
        foodServeLabel.text = "0"
        cleanSlider.value = 0
        cleanLabel.text = "0"
        giveBackLabel.text = "希望您再度光臨！"
    }
    
}

