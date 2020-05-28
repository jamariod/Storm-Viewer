//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Jamario Davis on 5/27/20.
//  Copyright © 2020 KAYCAM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    //Hides navigation bar on tap.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    //Will display naviation bar on tap.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.hidesBarsOnTap = false
    }
    //Makes visible to Obj C code
    @objc func sharedTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else
        {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        
        //Code to help show UIActivityViewController on iPad.
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
