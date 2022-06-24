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
        
        // Test Api
        SearchPhotoRequest.request(searchTerm: "Flower") { error, photos in
            print(photos?.photo?.first?.title)
            print(photos?.photo?.first?.flickrImageURL())
        }
    }

}

