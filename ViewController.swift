//
//  ViewController.swift
//  HideKeyboard
//
//  Created by user160057 on 10/20/19.
//  Copyright © 2019 user160057. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    
    weak var btnBack: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    
    //Actions
    @IBAction func btnBack(_ sender: UIButton) {
            ScrollView.setContentOffset (CGPoint.zero, animated: true)
            
            txtFirst.becomeFirstResponder()
    }
    @IBAction func btnView(_ sender: UIButton) {
        DismissKeyboard()
        
        var scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
        
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func MsgBox(_message: String)
    {
        let alert=UIAlertView()
        
        alert.title="Alert"
        alert.message = _message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    override func touchesBegan(_ touches: Set <UITouch>, with event: UIEvent?) {
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZip.endEditing(true)
        txtPhone.endEditing(true)
        txtEmail.endEditing(true)
    }
    
    @objc func DismissKeyboard() {
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZip.endEditing(true)
        txtPhone.endEditing(true)
        txtEmail.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField) {
        var scrollPoint: CGPoint
        scrollPoint = CGPoint (x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ScrollView.setContentOffset(CGPoint.zero, animated: true) }
    
    func textViewDidBeginEditing(_ textField: UITextView){
        var scrollPoint: CGPoint
        scrollPoint = CGPoint (x: 0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textViewDidEndEditing(_ textField: UITextView) {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    

    @IBAction func btnSave(_ sender: UIButton) {
        DismissKeyboard()
        
        if (txtFirst.text=="" || txtLast.text=="" || txtAddress.text=="" || txtCity.text=="" || txtState.text=="" || txtZip.text=="" || txtPhone.text=="" || txtEmail.text=="")
        {
            MsgBox (_message: "All fields are required, please correct!")
        }
        else  {
            if (txtView.text=="")
            {
                txtView.text = "My Contacts \n"
            }
            txtView.text="\(txtView.text!) \n(txtFirst.text!) \n(txtLast.text!) \n(txtAddress.text!) \n(txtCity.text!) \n(txtState.text!) \n(txtZip.text!) \n(txtPhone.text!) \n(txtEmail.text!)\n"
            
            txtFirst.text = ""
            txtLast.text = ""
            txtAddress.text = ""
            txtCity.text = ""
            txtState.text = ""
            txtZip.text = ""
            txtPhone.text = ""
            txtEmail.text = ""
            
            var scrollPoint:CGPoint
            
            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            
            ScrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        
        ScrollView.addGestureRecognizer(tap)
        
        let size: CGRect = UIScreen.main.bounds
        
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        
        txtFirst.becomeFirstResponder()
    }

        
    //override func didRecieveMemoryWarning() {
      //  super.didReceiveMemoryWarning()
   // }
    

}

