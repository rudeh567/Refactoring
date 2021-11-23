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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
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
    
    func viewSetting() {
        self.contentView.layer.cornerRadius 
    }
}
