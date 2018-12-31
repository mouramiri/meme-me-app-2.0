//
//  MemesTableViewController.swift
//  MemeMe
//
//  Created by Miriana Moura on 12/20/18.
//  Copyright © 2018 mmoura. All rights reserved.
//
import Foundation
import UIKit

class MemesTableViewController: UITableViewController {

    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
        self.tableView.separatorColor = UIColor.clear
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemesTableViewCell", for: indexPath) as! MemesTableViewCell
        let meme = memes[indexPath.row]
        
        cell.tableImageView.image = meme.memedImage
        cell.tableTextView.text = memes[indexPath.row].topText + "..." + memes[indexPath.row].bottomText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "detailMemeViewController") as! MemeDetailViewController
        
        //Populate view controller with data from the selected item
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        // Present the view controller using navigation
        self.navigationController!.pushViewController(detailController, animated: true)
    }

}
