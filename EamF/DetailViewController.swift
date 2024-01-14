//
//  DetailViewController.swift
//  EamF
//
//  Created by RLogixxTraining on 16/08/23.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    @IBOutlet weak var imgEmp: UIImageView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtName: UITextField!
    var imagestr: String = ""
    var empDetail = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        var dict = ["name":txtName.text ?? "" , "address" : txtAddress.text ?? "" ,  "image" :imagestr]
        empDetail.append(dict)
        //print(empDetail)
        
        
    }
    
    @IBAction func btnShow(_ sender: Any) {
        
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "nav") as! tblNavViewController
        nav.emparr = empDetail
        self.navigationController?.pushViewController(nav, animated: true)
        }
    
    @IBAction func btnSelect(_ sender: Any) {
        let alert = UIAlertController(title: "Options ", message: nil, preferredStyle: .actionSheet)
               
               alert.addAction(UIAlertAction(title: "Gallery", style:.default,handler: { _ in  self.openGallery()
                   
               }))
               
               alert.addAction(UIAlertAction(title: "Cancel", style:.default,handler: nil ))
               self.present(alert, animated:  true ,completion:  nil)

        
    }
    func openGallery()
       {
           if UIImagePickerController.isSourceTypeAvailable( UIImagePickerController.SourceType.photoLibrary){
               let imagepicker = UIImagePickerController()
               imagepicker.delegate = self
               imagepicker.sourceType = UIImagePickerController.SourceType.photoLibrary
               imagepicker.allowsEditing = false
               self.present(imagepicker , animated: true ,completion: nil)
               
           }
           else
           {
               let alert = UIAlertController(title: "Warning", message: " not to Gallery ", preferredStyle: .alert )
               alert.addAction(UIAlertAction(title: "ok",style: .default, handler: nil))
               self.present(alert , animated: true ,completion: nil)
           }
       }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[.originalImage] as? UIImage{
               imgEmp.image = pickedImage
               // print(convertImageToBase64String(img: pickedImage))
               
                imagestr = convertImageToBase64String(img: pickedImage)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        func convertImageToBase64String(img: UIImage) -> String {
            var strImage =  img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
            return  strImage
        }

    
}
