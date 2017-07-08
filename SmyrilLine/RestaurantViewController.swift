//
//  RestaurantViewController.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/8/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SDWebImage
import SVProgressHUD

class RestaurantViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var restaurantTableview: UITableView!
    var restaurantObject: myTestRestaurent?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Restaurants"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        callRestaurantWebservice()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func callRestaurantWebservice()   {
        
        let url = "\(baseUrl)Restaurants/eng"
        
        SVProgressHUD.show()
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        .responseArray { (response: DataResponse<[myTestRestaurent]>) in
            
            SVProgressHUD.dismiss()
            switch response.result{
            case .success:
                self.restaurantObject = response.result.value?[0]
                
                self.restaurantTableview.reloadData()
            case .failure:
                print("Error:\(String(describing: response.result.error?.localizedDescription))")
            }
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
        return self.restaurantObject?.allRestaurants?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantTableViewCell
        cell.restaurantName.text = self.restaurantObject?.allRestaurants![indexPath.row].restaurantname
        cell.restaurantImageView.sd_setShowActivityIndicatorView(true)
        cell.restaurantImageView.sd_setIndicatorStyle(.gray)
        var imageurl = imageBaseUrl
        imageurl += (self.restaurantObject?.allRestaurants?[indexPath.row].restaurantImageUrlStr)!
        cell.restaurantImageView.sd_setImage(with: URL(string: imageurl), placeholderImage: nil)
        return cell
        
    }
    
}


