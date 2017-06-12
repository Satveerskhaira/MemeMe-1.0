//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Satveer Singh on 04/06/17.
//  Copyright © 2017 Satveer Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var actualImage: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TakeImgeByCamera(_ sender: Any) {
        print("take image by camera")
    }

    @IBAction func PickImageFromAlbum(_ sender: Any) {
        print("pick image from album")
    }
    
    @IBAction func ShareMeme(_ sender: Any) {
    print("share meme")
    }
    @IBAction func ResetMemeView(_ sender: Any) {
        self.topText.text = " "
        self.bottomText.text = " "
        print("reset meme veiw")
    
    }

}

