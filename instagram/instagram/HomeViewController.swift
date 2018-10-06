//
//  HomeViewController.swift
//  instagram
//
//  Created by Mely Bohlman on 10/1/18.
//  Copyright © 2018 Chris Bohlman. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var postTableView: UITableView!
    var posts: [PFObject] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.dataSource = self
        postTableView.delegate = self
        // construct query
        refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(HomeViewController.didPullToRefresh(_:)), for: .valueChanged)
        postTableView.insertSubview(refreshControl, at: 0)

        
        let query = Post.query()!
        query.limit = 20
        query.includeKey("caption")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        
        // fetch data asynchronously
        query.findObjectsInBackground { (newPosts, error: Error?) in
            if let newPosts = newPosts {
                self.posts = newPosts
                self.postTableView.reloadData()
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
        postTableView.reloadData()
    }
    
    func queryForPosts() {
        let query = Post.query()!
        query.limit = 20
        query.includeKey("caption")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        
        // fetch data asynchronously
        query.findObjectsInBackground { (newPosts, error: Error?) in
            if let newPosts = newPosts {
                self.posts = newPosts
                self.postTableView.reloadData()
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
        postTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        queryForPosts()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let newPost = posts[indexPath.row]
        cell.instagramPost = newPost
        return cell
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
