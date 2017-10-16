import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    var tip = 0.0
    var sliderPersent = 0.0
    var buttonTapped = false
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
        buttonTapped = true
    }
    
    @IBOutlet weak var adjustTipPercentage: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        if (buttonTapped){
            self.sliderPersent = Double(sliderValue)
            print("changed silder value (if)")
            let decimal = Double(sliderPersent) * 1/100
            self.tip = Double(billAmountTextField.text!)! * decimal
            print("calculateTip-tip\(tip)")
            tipAmountLabel.text = "calculated tip is \(String(tip))$"
        }
        print("changed silder value ()")
        sliderLabel.text = "\(String(sliderValue)) %"
        self.sliderPersent = Double(sliderValue)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipAmountLabel.text = "calculated tip is"
        
        let currentValue = Int(adjustTipPercentage.value)
        print("Slider changing to \(currentValue) ?")
        
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyboardWillShow(notification:)),name:NSNotification.Name.UIKeyboardWillShow ,object:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    // keyboard disable
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        billAmountTextField.resignFirstResponder()
//        return true
//    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                
                if self.view.frame.origin.y == 0{
                    self.view.frame.origin.y -= keyboardSize.height
                    print("HELLO")
                    print("keyboardSize\(keyboardSize.height)")
                }
            }
        }
    @objc func keyboardWillHide(notification: NSNotification) {
            
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y != 0{
                    self.view.frame.origin.y += keyboardSize.height
                }
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// keyboard disable
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
