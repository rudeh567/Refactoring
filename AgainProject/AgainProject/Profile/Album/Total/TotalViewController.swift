//
//  TotalViewController.swift
//  AgainProject
//
//  Created by yeoboya on 2021/11/26.
//

import UIKit

class TotalViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ProfileViewModel()
    var cellSize: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewSetting()
    }
    
    func collectionViewSetting() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        collectionView.reloadData()
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
