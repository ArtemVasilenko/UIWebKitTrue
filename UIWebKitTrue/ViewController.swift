

import UIKit
import WebKit

final class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var myWebKit: WKWebView!
    @IBOutlet weak var goBack: UIBarButtonItem!
    @IBOutlet weak var goForward: UIBarButtonItem!
    @IBOutlet weak var refresh: UIBarButtonItem!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let application = UIApplication.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.delegate = self
        urlTextField.text = "https://google.com"
        myWebKit.navigationDelegate = self
        activityIndicator.isHidden = true
        
    }
    
    @IBAction func goBackAction(_ sender: UIBarButtonItem) {
        myWebKit.goBack()
    }
    @IBAction func goForwardAction(_ sender: UIBarButtonItem) {
        myWebKit.goForward()
    }
    @IBAction func reload(_ sender: UIBarButtonItem) {
        myWebKit.reload()
    }
    
    
     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let url = URL(string: textField.text!) else { return }
        let requset = URLRequest(url: url)
        self.myWebKit.load(requset)
        print("url = ", url.port, url.user, url.password, url.scheme)
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == urlTextField {
            self.urlTextField.resignFirstResponder()
        }
        return true
    }
}

extension ViewController: WKNavigationDelegate {
    
     func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        self.goForward.isEnabled = false
        self.goBack.isEnabled = false
        activityIndicator.isHidden = false

    }
    
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        application.isNetworkActivityIndicatorVisible = true
        activityIndicator.isHidden = true

        if webView.canGoBack {
            self.goBack.isEnabled = true
        }
        if webView.canGoForward {
            self.goForward.isEnabled = true
        }
        
    }
    
}

