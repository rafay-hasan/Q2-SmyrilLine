//
//  TaxFreeViewController.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/6/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import UIKit

class TaxFreeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "taxFreeCell", for: indexPath) as! TaxFreeCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch UIScreen.main.nativeBounds.height
        {
        case 480:
            print("iPhone Classic")
            let size = CGSize(width: 140, height: 219)
            return size
        case 960:
            print("iPhone 4 or 4S")
            let size = CGSize(width: 140, height: 219)
            return size
        case 1136:
            print("iPhone 5 or 5S or 5C")
            let size = CGSize(width: 140, height: 219)
            return size
        case 1334:
            print("iPhone 6 or 6S")
            let size = CGSize(width: 166, height: 219)
            return size
        case 2208:
            print("iPhone 6+ or 6S+")
            let size = CGSize(width: 186, height: 219)
            return size
        default:
            print("unknown")
            let size = CGSize(width: 186, height: 219)
            return size
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(16.0, 16.0, 16.0, 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 8.0
    }
    
}