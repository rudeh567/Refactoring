//
//  ProfileVIew.swift
//  AgainProject
//
//  Created by yeoboya on 2021/11/23.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var costsView: UIView!
    @IBOutlet weak var photoCountLabel: UILabel!
    @IBOutlet weak var totalPhotoButton: UIButton!
    @IBOutlet weak var dimmedView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        viewSetting()
        dimissSetting()
        collectionViewSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        viewSetting()
        dimissSetting()
        collectionViewSetting()
    }
    
    private func loadView() {
        let nibs = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)
        
        guard let view = nibs?.first as? UIView else {
            print("nib error *********")
            return
        }

        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func collectionViewSetting() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
    }
    
    func dimissSetting() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dismissProfile(_:)))
        dimmedView.addGestureRecognizer(dimmedTap)
        dimmedView.isUserInteractionEnabled = true
    }
    
    @objc func dismissProfile(_ tapRecognizer: UITapGestureRecognizer) {
        self.dimissAni()
    }
    
    func viewSetting() {
        // ClipsTobounds
        contentView.clipsToBounds = true
        profileImage.clipsToBounds = true
        genderView.clipsToBounds = true
        likeView.clipsToBounds = true
        locationView.clipsToBounds = true
        costsView.clipsToBounds = true
        totalPhotoButton.clipsToBounds = true
        
        //radius
        contentView.layer.cornerRadius = 50
        contentView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        likeView.layer.cornerRadius = 18
        genderView.layer.cornerRadius = 11
        locationView.layer.cornerRadius = 13.5
        costsView.layer.cornerRadius = 4
        totalPhotoButton.layer.cornerRadius = 11
        
        //border
        likeView.layer.borderWidth = 1
        likeView.layer.borderColor = UIColor(named: "veryLightPinkTwo")?.cgColor
        genderView.layer.borderWidth = 1
        genderView.layer.borderColor = UIColor(named: "pinkTwo")?.cgColor
        locationView.layer.borderWidth = 1
        locationView.layer.borderColor = UIColor(named: "lightBlueGrey")?.cgColor
        costsView.layer.borderWidth = 1
        costsView.layer.borderColor = UIColor(named: "whiteFour")?.cgColor
        
        //background color
        likeView.backgroundColor = UIColor(named: "veryLightPink")
        locationView.backgroundColor = UIColor(named: "iceBlue")
        costsView.backgroundColor = UIColor(named: "whiteTwo")
        locationLabel.textColor = UIColor(named: "fadedBlue")
    
        //MARK: 텍스트 부분 변경
        // label의 텍스트를 가지고 옵니다.
        guard let text = self.photoCountLabel.text else { return }
        // label의 text로 NSMutableAttributedString 인스턴스를 만듭니다.
        let attributedString = NSMutableAttributedString(string: text)
        // NSMutableAttributedString에 속성을 추가합니다.
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "2"))
        // label에 방금 만든 속성을 적용합니다.
        self.photoCountLabel.attributedText = attributedString
    }
}
