//
//  DetailViewController.swift
//  AirDropDemo
//
//  Created by Pablo Mateo Fernández on 27/01/2017.
//  Copyright © 2017 355 Berry Street S.L. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var webView:UIWebView!
    
    var filename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the full path of the file
        if let fileURL = fileToURL(file: filename) {
            let urlRequest = URLRequest(url: fileURL)
            webView.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fileToURL(file: String) -> URL? {
        // Get the full path of the file
        let fileComponents = file.components(separatedBy: ".")
        
        if let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) {
            return URL(fileURLWithPath: filePath) 
        }
        
        return nil
    }

}
