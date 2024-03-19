//
//  ViewController.swift
//  CollectionView App
//
//  Created by MSCIT on 19/03/24.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2000;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for:    indexPath)

                cell.backgroundColor  = self.customeColor();

                return cell
    }
    func customeColor()-> UIColor{

            let red = CGFloat(drand48())

            let green = CGFloat(drand48())

            let blue = CGFloat(drand48())
        
        let alpha = CGFloat(drand48());

            

            return UIColor(red: red, green: green, blue: blue, alpha: alpha)

        }
    
    @IBOutlet weak var cv: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view.
    }


}

