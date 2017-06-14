//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Satveer Singh on 04/06/17.
//  Copyright © 2017 Satveer Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var actualImage: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    // MARK : Dictionary for text field attributes
    
    let memeAttributes: [String: Any] = [NSStrokeColorAttributeName: UIColor.black,
                                         NSForegroundColorAttributeName: UIColor.black,
                                         NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
                                         NSStrokeWidthAttributeName: 1.0 ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        topText.defaultTextAttributes = memeAttributes
        bottomText.defaultTextAttributes = memeAttributes
        topText.delegate = self
        bottomText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : Image Picker by Camera
    @IBAction func TakeImgeByCamera(_ sender: Any) {
        let pickerImage = UIImagePickerController()
        pickerImage.sourceType = .camera
        pickerImage.delegate = self
        present(pickerImage, animated: true, completion: nil)
    }
    
    //MARK : Image Picker from Album
    
    @IBAction func PickImageFromAlbum(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK : Activity bar
    @IBAction func ShareMeme(_ sender: Any) {
        let image = actualImage!
        let shareActivity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(shareActivity, animated: true, completion: nil)
    }
    
    
    @IBAction func ResetMemeView(_ sender: Any) {
        self.topText.text = " "
        self.bottomText.text = " "
            
    }
    
    //MARK : Image picker delegate menthods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.actualImage.image = image
            if picker.sourceType == .camera {
                //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

}

