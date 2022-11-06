//
//  CameraViewController.swift
//  CataTracker
//
//  Created by Damilola Awofisayo on 11/4/22.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .secondarySystemBackground

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
        picker.allowsEditing = true
            present(picker, animated: true)
    }

}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        else{
            return
        }
        imageView.image = image
        
        let vc = TableTableViewCell()
        vc.photo.image = image
        
        //ViewController().cell.photo.image = image
        
    }
}
    
    
