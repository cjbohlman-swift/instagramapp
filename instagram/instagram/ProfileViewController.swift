//
//  ProfileViewController.swift
//  instagram
//
//  Created by Mely Bohlman on 10/1/18.
//  Copyright © 2018 Chris Bohlman. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBAction func onLogOut(_ sender: Any) {
        PFUser.logOutInBackground{ (error) in
            if (error != nil) {
                print(error?.localizedDescription)
            }
        }
        performSegue(withIdentifier: "LogoutSegue", sender: nil)
        print("logged out")
    }
    
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

}
