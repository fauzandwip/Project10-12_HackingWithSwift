//
//  DetailViewController.swift
//  Project10-12
//
//  Created by Fauzan Dwi Prasetyo on 05/05/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPhoto: Photo?
    var path: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedPhoto?.caption
        navigationItem.largeTitleDisplayMode = .never
        
        if let url = path {
            if let imageData = try? Data(contentsOf: url) {
                let image = UIImage(data: imageData)
                imageView.image = image
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
}
