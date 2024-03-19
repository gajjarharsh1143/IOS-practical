//
//  ViewController.swift
//  ScrollVieew App
//
//  Created by MSCIT on 19/03/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollviewObj: UIScrollView!
    var img : UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollviewObj.minimumZoomScale = 0.25;
        scrollviewObj.maximumZoomScale = 2;
        
        scrollviewObj.delegate = self;
        
        let image = UIImage(named: "img1.jpeg");
        img = UIImageView(image: image);
        
        scrollviewObj.contentSize = image!.size
        
        scrollviewObj.addSubview(img!);
        
        scrollviewObj.zoomScale = 2;
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return img;
    }
    
}

