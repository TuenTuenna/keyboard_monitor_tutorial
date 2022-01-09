//
//  ViewController.swift
//  keyboard_event_tutorial_uikit
//
//  Created by Jeff Jeong on 2022/01/09.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var keyboardMonitor : KeyboardMonitor?

    @IBOutlet var registerBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet var myTextField: UITextField!
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tap)
        
        keyboardMonitor = KeyboardMonitor()
        
        self.myTextField.delegate = self
        
        // 키보드 이벤트 처리
        observingKeyboardEvent()
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }

}

//MARK: - 텍스트필드 델리겟 관련
extension ViewController : UITextFieldDelegate{
    
    /// 텍스트 필드 엔트 눌렀을때
    /// - Parameter textField: <#textField description#>
    /// - Returns: <#description#>
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("ViewController - textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - 키보드 관련
extension ViewController {
    
    /// 키보드 이벤트 처리
    fileprivate func observingKeyboardEvent(){
        keyboardMonitor?.$keyboardHeight.sink{ height in
            print("ViewController - $keyboardHeight : ", height)
            
//            if height > 0 {
//                self.registerBtnBottomConstraint.constant = height
//            } else {
//                self.registerBtnBottomConstraint.constant = 50
//            }
            self.registerBtnBottomConstraint.constant = height > 0 ? height : 50
            
        }.store(in: &subscriptions)
    }
}

