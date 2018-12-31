//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Miriana Moura on 12/20/18.
//  Copyright © 2018 mmoura. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme?
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailImageView.image = meme!.memedImage
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
