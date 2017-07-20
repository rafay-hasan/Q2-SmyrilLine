//
//  DestinationDetailsViewController.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/9/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SDWebImage
import SVProgressHUD

class DestinationDetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var destinationId:String?
    var destinationName:String?
    var destinationProgrammeObject:DestinationType?
    
    @IBOutlet weak var programmeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = self.destinationName!
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        callDestinationCategoryWebservice()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callDestinationCategoryWebservice()   {
        
        let url = "\(baseUrl)Destinations/eng/\(self.destinationId!)"
        
        SVProgressHUD.show()
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseObject { (response: DataResponse<DestinationType>) in
                self.destinationProgrammeObject = response.result.value
                
                print(response.result.error?.localizedDescription ?? "Please try again later",response.result.isSuccess)
                
                self.programmeCollectionView.reloadData()
                SVProgressHUD.dismiss()
        }
        
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
        return self.destinationProgrammeObject?.allDestinationProgramme?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsDestinationCell", for: indexPath) as! DestinationDetailsCollectionViewCell
        cell.categoryNameLabel.text = self.destinationProgrammeObject?.allDestinationProgramme![indexPath.row].programmeName
        cell.categoryImageView.sd_setShowActivityIndicatorView(true)
        cell.categoryImageView.sd_setIndicatorStyle(.gray)
        var imageurl = imageBaseUrl
        imageurl += (self.destinationProgrammeObject?.allDestinationProgramme?[indexPath.row].programmeImageUrlStr)!
        cell.categoryImageView.sd_setImage(with: URL(string: imageurl), placeholderImage: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "destinationDetails", for: indexPath) as! DestinationDetailsCollectionReusableView
            headerView.headerDetailsLabel.text = self.destinationProgrammeObject?.destinationDetails
            headerView.headerImageView.sd_setShowActivityIndicatorView(true)
            headerView.headerImageView.sd_setIndicatorStyle(.gray)
            let imageurl = imageBaseUrl
            let shopImage = self.destinationProgrammeObject?.destinationImageUrlStr ?? ""
            headerView.headerImageView.sd_setImage(with: URL(string: imageurl + shopImage), placeholderImage: nil)
            
            
            headerView.backgroundColor = UIColor.clear;
            return headerView
            
            //        case UICollectionElementKindSectionFooter:
            //            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Footer", forIndexPath: indexPath) as! UICollectionReusableView
            //
            //            footerView.backgroundColor = UIColor.clear();
            //            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch UIScreen.main.nativeBounds.height
        {
        case 480:
            print("iPhone Classic")
            let size = CGSize(width: 135, height: 125)
            return size
        case 960:
            print("iPhone 4 or 4S")
            let size = CGSize(width: 135, height: 125)
            return size
        case 1136:
            print("iPhone 5 or 5S or 5C")
            let size = CGSize(width: 135, height: 125)
            return size
        case 1334:
            print("iPhone 6 or 6S")
            let size = CGSize(width: 160, height: 150)
            return size
        case 2208:
            print("iPhone 6+ or 6S+")
            let size = CGSize(width: 160, height: 150)
            return size
        default:
            print("unknown")
            let size = CGSize(width: 160, height: 150)
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
