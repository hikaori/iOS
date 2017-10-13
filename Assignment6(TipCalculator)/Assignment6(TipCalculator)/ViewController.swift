import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    var tip = 0.0
    var sliderPersent = 0.0
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBAction func calculateTip(_ sender: Any) {
        // input text varsion
//        let decimal = Double(tipPercentageTextField.text!)! * 1/100
        // slider varsion
        let decimal = Double(sliderPersent) * 1/100
        self.tip = Double(billAmountTextField.text!)! * decimal
        print("calculateTip-tip\(tip)")
//        tipAmountLabel.text = String(tip)
        tipAmountLabel.text = "calculated tip is \(String(tip))$"
    }
    
    @IBOutlet weak var adjustTipPercentage: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        sliderLabel.text = "\(String(sliderValue)) %"
        self.sliderPersent = Double(sliderValue)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAmountLabel.text = "calculated tip is"
        
        if adjustTipPercentage.isContinuous == true{
            self.sliderPersent = UISlider.v
        }
        
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                print("HELLO")
                if self.view.frame.origin.y == 0{
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
        func keyboardWillHide(notification: NSNotification) {
            
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y != 0{
                    self.view.frame.origin.y += keyboardSize.height
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
