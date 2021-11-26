////
////  scrollDelegate.swift
////  AgainProject
////
////  Created by yeoboya on 2021/11/26.
////
//
//import Foundation
//import UIKit
//
//extension ScrollView: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let value = scrollView.contentOffset.x/scrollView.frame.size.width
//        scrollLable.text = "\(Int(round(value)) + 1) / \(viewModel.photo?.photoList!.count ?? 0)"
//    }
//}
