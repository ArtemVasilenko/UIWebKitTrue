

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var myWebKit: WKWebView!
    @IBOutlet weak var goBack: UIToolbar!
    @IBOutlet weak var goForward: UIBarButtonItem!
    @IBOutlet weak var refresh: UIBarButtonItem!
    @IBOutlet weak var urlTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.delegate = self
        
    }
    
    
    @IBAction func goBackAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func goForwardAction(_ sender: UIBarButtonItem) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {

        guard let url = URL(string: textField.text!) else {
            return
        }
        let requset = URLRequest(url: url)
        self.myWebKit.load(requset)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == urlTextField {
            self.urlTextField.resignFirstResponder()
            }
        return true
    }
}

