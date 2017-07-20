//
//  ShipInfoDetailsViewController.swift
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


class ShipInfoDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var shipInfoCategoryId:String?
    var shipInfoDetailsObject:shipInfoDetails?
    
    @IBOutlet weak var shipInfoDetailsTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.shipInfoDetailsTableview.estimatedRowHeight = 50
        self.shipInfoDetailsTableview.rowHeight = UITableViewAutomaticDimension
        self.shipInfoDetailsTableview.estimatedSectionHeaderHeight = 180;
        self.shipInfoDetailsTableview.sectionHeaderHeight = UITableViewAutomaticDimension
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        callShipInfoDetailsWebservice()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callShipInfoDetailsWebservice()   {
        
        let url = "\(baseUrl)ShipInfo/eng/\(self.shipInfoCategoryId!)"
        SVProgressHUD.show()
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseObject { (response: DataResponse<shipInfoDetails>) in
                self.shipInfoDetailsObject = response.result.value
                
                print(response.result.error?.localizedDescription ?? "Please try again later",response.result.isSuccess)
                
                self.shipInfoDetailsTableview.reloadData()
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

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoDetailsCell", for: indexPath) as! ShipInfoDetailsTableViewCell
        cell.detailInfoLabel.text = self.shipInfoDetailsObject?.shipDetails
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let  headerView = tableView.dequeueReusableCell(withIdentifier: "infoHeaderCell") as! ShipInfoHeaderTableViewCell
        headerView.headerImageView.sd_setShowActivityIndicatorView(true)
        headerView.headerImageView.sd_setIndicatorStyle(.gray)
        let imageurl = imageBaseUrl
        let shopImage = self.shipInfoDetailsObject?.imageUrlStr ?? ""
        headerView.headerImageView.sd_setImage(with: URL(string: imageurl + shopImage), placeholderImage: nil)
        headerView.backgroundColor = UIColor.clear;
        return headerView
    }

}
