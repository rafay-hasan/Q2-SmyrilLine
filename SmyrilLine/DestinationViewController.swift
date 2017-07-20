//
//  DestinationViewController.swift
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


class DestinationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var destinationObject: smyrilLineDestination?
    
    @IBOutlet weak var destinationTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Destinations"
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        callDestinationWebservice()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func callDestinationWebservice()   {
        
        let url = "\(baseUrl)Destinations/eng"
        
        SVProgressHUD.show()
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseArray { (response: DataResponse<[smyrilLineDestination]>) in
                
                SVProgressHUD.dismiss()
                switch response.result{
                case .success:
                    self.destinationObject = response.result.value?[0]
                    
                    self.destinationTableview.reloadData()
                case .failure:
                    print("Error:\(String(describing: response.result.error?.localizedDescription))")
                }
        }
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "destinationDetails"
        {
            let indexPath = self.destinationTableview.indexPathForSelectedRow
            let vc = segue.destination as! DestinationDetailsViewController
            vc.destinationId = self.destinationObject?.allDestinations![(indexPath?.row)!].destinationId
            vc.destinationName = self.destinationObject?.allDestinations![(indexPath?.row)!].destinationname
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.destinationObject?.allDestinations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "destinationCell", for: indexPath) as! DestinationTableViewCell
        cell.destinationNameLabel.text = self.destinationObject?.allDestinations![indexPath.row].destinationname
        cell.destinationImageView.sd_setShowActivityIndicatorView(true)
        cell.destinationImageView.sd_setIndicatorStyle(.gray)
        var imageurl = imageBaseUrl
        imageurl += (self.destinationObject?.allDestinations?[indexPath.row].destinationImageUrlStr)!
        cell.destinationImageView.sd_setImage(with: URL(string: imageurl), placeholderImage: nil)
        return cell
        
    }


}
