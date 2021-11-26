////
////  TotalView.swift
////  AgainProject
////
////  Created by yeoboya on 2021/11/25.
////
//
//import Foundation
//import UIKit
//
//class TotalView: UIView {
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    let viewModel = ProfileViewModel()
//    var cellSize: CGFloat = 0
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        loadView()
//        collectionViewSetting()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        loadView()
//        collectionViewSetting()
//    }
//    
//    private func loadView() {
//        let nibs = Bundle.main.loadNibNamed("TotalView", owner: self, options: nil)
//        
//        guard let view = nibs?.first as? UIView else {
//            print("nib error *********")
//            return
//        }
//
//        view.frame = self.bounds
//        self.addSubview(view)
//    }
//    
//    func collectionViewSetting() {
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
//        self.collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
//        collectionView.reloadData()
//    }
//    
//    @IBAction func dissmissView(_ sender: Any) {
//        self.dimissAni(y: 0)
//    }
//    
//}
