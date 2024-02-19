//
//  ViewController.swift
//  NavigationApp
//
//  Created by MSCIT on 15/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnclickevent(_ sender: Any) {
        let S2obj = self.storyboard?.instantiateViewController(identifier: "S2") as! S2
        
        self.present(S2obj, animated: true)
    }
    @IBOutlet weak var imglayout: UIImageView!
    @IBAction func playclick(_ sender: Any) {
        animation_img()
        imglayout.startAnimating()
    }
    @IBAction func paseclick(_ sender: Any) {
        imglayout.stopAnimating()
    }
    
    func animation_img() {
        imglayout.animationImages = [UIImage(imageLiteralResourceName: "img1.jpeg"),UIImage(imageLiteralResourceName: "img2.jpeg"),UIImage(imageLiteralResourceName: "img3.jpeg")]
        
        imglayout.animationDuration = 2
        imglayout.animationRepeatCount = 3
    }
}

