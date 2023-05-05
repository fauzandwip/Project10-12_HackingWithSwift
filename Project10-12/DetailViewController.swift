//
//  DetailViewController.swift
//  Project10-12
//
//  Created by Fauzan Dwi Prasetyo on 05/05/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedPhoto: Photo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI() {
        
        title = selectedPhoto?.caption
        
        var image = UIImage()
        let imagePath = getDocumentsDirectory().appending(path: selectedPhoto!.imageName)

        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = image
        if let imageData = try? Data(contentsOf: imagePath) {
            let image = UIImage(data: imageData)
            imageView.image = image
        }
        view.addSubview(imageView)

        view.restorationIdentifier = "Detail"

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
