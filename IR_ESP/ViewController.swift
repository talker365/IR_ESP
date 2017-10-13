//
//  ViewController.swift
//  IR_ESP
//
//  Created by Jeffrey Hensley on 10/7/17.
//  Copyright © 2017 Jeffrey Hensley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var txtIP: UITextField!
    @IBOutlet weak var lblConnection: UILabel!
    @IBOutlet weak var txtCommands: UITextField!
    @IBOutlet weak var txtStatus: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        txtIP.delegate = self
        txtCommands.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func executeIrCommand(command: String) {
        // Build URL querystring...
        txtStatus.text = txtStatus.text! + "\nSending " + command + " to " + txtIP.text!
        
        if let url = URL(string: "http://" + txtIP.text! + "/ir?command=" + command) {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
                txtStatus.text = txtStatus.text! + "\nReturned value: " + contents
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
    }
    
//MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //lblConnection.text = "Press Test to verify connection"
        lblConnection.text = "hahahaha-delegate"
    }
    
//MARK: Actions
    @IBAction func btnTest(_ sender: UIButton) {
        if txtIP.text == "" {
            lblConnection.text = "Please speficy an IP"
        }
        else {
            lblConnection.text = "Successful connection!"
        }
        
    }
    
    @IBAction func btnCommand(_ sender: UIButton) {
        executeIrCommand(command: txtCommands.text!)
    }
    
    @IBAction func btnControlPower(_ sender: UIButton) {
        executeIrCommand(command: "power")
    }
    
    @IBAction func btnControlInput(_ sender: UIButton) {
        executeIrCommand(command: "input")
    }
    
    @IBAction func btnControlUp(_ sender: UIButton) {
        executeIrCommand(command: "up")
    }
    
    @IBAction func btnControlDown(_ sender: UIButton) {
        executeIrCommand(command: "down")
    }
    
    @IBAction func btnControlEnter(_ sender: UIButton) {
        executeIrCommand(command: "enter")
    }
    
    @IBAction func btnControlVolumeDown(_ sender: UIButton) {
        executeIrCommand(command: "volumeDown")
    }
    
    @IBAction func btnControlVolumeUp(_ sender: UIButton) {
        executeIrCommand(command: "VolumeUp")
    }
    
    
    
    
    @IBAction func txtIPChange(_ sender: UITextField) {
        lblConnection.text = "Press Test to verify connection"
    }
}

