//
//  ProfileVIew.swift
//  AgainProject
//
//  Created by yeoboya on 2021/11/23.
//

import Foundation
import UIKit
import Kingfisher

class ProfileView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var costsView: UIView!
    @IBOutlet weak var photoCountLabel: UILabel!
    @IBOutlet weak var totalPhotoButton: UIButton!
    @IBOutlet weak var dimmedView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var costsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let viewModel = ProfileViewModel()
    var safeArea: CGFloat = 0
    
    var showTotal: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        viewSetting()
        dimissSetting()
        viewModel.getProfileInfo(completion: dataReceive)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        viewSetting()
        dimissSetting()
        viewModel.getProfileInfo(completion: dataReceive)
    }
    
    @IBAction func showTotal(_ sender: Any) {
        showTotal!()
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
        self.dimissAni(y: 0)
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
    
        //MARK: ????????? ?????? ??????
        // label??? ???????????? ????????? ?????????.
        guard let text = self.photoCountLabel.text else { return }
        // label??? text??? NSMutableAttributedString ??????????????? ????????????.
        let attributedString = NSMutableAttributedString(string: text)
        // NSMutableAttributedString??? ????????? ???????????????.
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: (text as NSString).range(of: "???"))
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: (text as NSString).range(of: "???"))
        // label??? ?????? ?????? ????????? ???????????????.
        self.photoCountLabel.attributedText = attributedString
    }
    
    func dataReceive(check: Bool) {
        if check {
            photoCountLabel.text = "??? \(viewModel.photo?.photoList?.count ?? 0)???"
            likeLabel.text = viewModel.member?.totLikeCnt
            genderLabel.text = viewModel.member?.mem_age
            nameLabel.text = viewModel.member?.chat_name
            locationLabel.text = "|  \(viewModel.member?.loc ?? "??????")"
            costsLabel.text = viewModel.member?.chat_conts
            profileImage.kf.setImage(with: URL(string: viewModel.photo?.profile ?? viewModel.defaultImage))

            collectionViewSetting()
            collectionView.reloadData()
        } else {
            print("???????????????????????????.")
        }
    }
}
