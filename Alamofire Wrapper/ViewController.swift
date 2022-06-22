//
//  ViewController.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/22/22.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // test url
        let url = URL(server: .defined(.flickrBaseUrl), method: "flickr.photos.getRecent", apiKey: Constants.flickrApiKey, format: "json", perPage: 20, page: 1)
        
    }

}

