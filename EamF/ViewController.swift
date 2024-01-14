//
//  ViewController.swift
//  EamF
//
//  Created by RLogixxTraining on 10/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblsh: UILabel!
    @IBOutlet weak var txtfldB: UITextField!
    @IBOutlet weak var txtfldA: UITextField!
    let a = Int()
    let b = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //var a: Int? = Int(txtfldA.text ?? "")
        //var b: Int? = Int(txtfldA.text ?? "")
    }

    @IBAction func btnadd(_ sender: Any) {
        let a = Int(txtfldA.text!)
        let b = Int(txtfldB.text!)
        var result = a! + b!
        lblsh.text = "\(result)"
        }
    
    @IBAction func btnsub(_ sender: Any) {
        
    }
    
    @IBAction func btnmult(_ sender: Any) {
    }
    
    @IBAction func btndiv(_ sender: Any) {
    }
    
}


