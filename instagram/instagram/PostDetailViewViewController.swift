//
//  PostDetailViewViewController.swift
//  instagram
//
//  Created by Mely Bohlman on 10/6/18.
//  Copyright © 2018 Chris Bohlman. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostDetailViewViewController: UIViewController {

    var post: PFObject?
    
    
    @IBOutlet weak var postImageView: PFImageView!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = post {
            postImageView.file = post["media"] as? PFFile
            postImageView.load(inBackground: nil)
            captionLabel.text = post["caption"] as? String
            print(post.createdAt!)
            let createdAtDate = post.createdAt!
            let formatter = DateFormatter()
            // initially set the format based on your datepicker date / server String
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let myString = formatter.string(from: createdAtDate) // string purpose I add here
            // convert your string to date
            let yourDate = formatter.date(from: myString)
            //then again set the date format whhich type of output you need
            formatter.dateFormat = "dd-MMM-yyyy"
            // again convert your date to string
            let myStringafd = formatter.string(from: yourDate!)
            
            print(myStringafd)
            timestampLabel.text = myStringafd
            
            //var formatter = DateFormatter()
            //print(formatter.string(from: createdAt))
            //timestampLabel.text =  String(formatter.string(from: createdAt))
            /*
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
            let showDate = inputFormatter.date(from: createdAt)
            inputFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
            let resultString = inputFormatter.string(from: showDate!)
            //print(resultString)
 */
            //timestampLabel.text = createdAt
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
