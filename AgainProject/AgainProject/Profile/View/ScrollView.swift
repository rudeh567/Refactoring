////
////  ScrollView.swift
////  AgainProject
////
////  Created by yeoboya on 2021/11/26.
////
//
//import Foundation
//import UIKit
//import Kingfisher
//
//class ScrollView: UIView {
//    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var scrollLable: UILabel!
//    
//    let viewModel = ProfileViewModel()
//    var currentPage: Int = 0
//    var safeArea: CGFloat = 0
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        loadView()
//        scrollViewSetting()
//        setPageControl()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        loadView()
//        scrollViewSetting()
//        setPageControl()
//    }
//    
//    private func loadView() {
//        let nibs = Bundle.main.loadNibNamed("ScrollView", owner: self, options: nil)
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
//    func scrollViewSetting() {
//        scrollView.delegate = self
//        scrollView.frame.size.width = self.frame.width
//        
//        print("넓이 : \(self.frame.width)")
//        
//        scrollView.frame.size.height = self.frame.height - 200
//        
//        print("높이 : \(self.frame.height)")
//        
//        
//        scrollView.frame.origin.y = self.frame.height - SafeArea.rootSafeArea - scrollView.frame.height
//        scrollView.frame.origin.x = self.frame.origin.x
//        
//        print("safeArea: \(SafeArea.rootSafeArea)")
//        print("x : \(self.frame.origin.x)")
//        print("frame : \(self.scrollView.frame)")
//        
//        guard let photoCnt = viewModel.photo?.photoList?.count else { return }
//        
//        for i in 0...photoCnt {
//            let imageView = UIImageView()
//            imageView.contentMode = .scaleAspectFit
//            let xPos = self.frame.width * CGFloat(i)
//            imageView.frame = CGRect(x: xPos, y: 0, width: 300, height: 300)
//            imageView.kf.setImage(with: URL(string: viewModel.photo?.photoList?[i].url ?? viewModel.defaultImage))
//            scrollView.addSubview(imageView)
//            scrollView.contentSize.width = imageView.frame.width * CGFloat(i+1)
//        }
//    }
//    
//    // 내가 몇번째 페이지를 처음에 눌렀는지 확인하고 그 페이지부터 스크롤할 수 있게 하고 스크롤뷰 상단에 내가 몇번째 페이지를 보고 있는지 레이블로 출력해준다.
//    private func setPageControl() {
//        scrollView.setContentOffset(CGPoint(x: CGFloat(currentPage) * self.frame.width, y: 0), animated: true)
//        scrollLable.text = "\(currentPage + 1) / \(viewModel.photo?.photoList!.count ?? 0)"
//    }
//    
//    @IBAction func dismissView(_ sender: Any) {
//        self.dimissAni(y: self.safeArea)
//        
//        print("dimiss : \(self.safeArea)")
//    }
//}
