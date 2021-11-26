//
//  ViewController.swift
//  AgainProject
//
//  Created by yeoboya on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: 사연 보내기를 눌렀을 때 버튼 기능입니다.
    //커스텀으로 만들었던 뷰의 객체를 만들어주고 extension으로 선언했던 함수를 이용해 뷰 컨트롤러에 애니메이션으로 띄워줍니다.
    @IBAction func openProfile(_ sender: Any) {
        let view = ProfileView()
        view.frame = UIScreen.main.bounds
        view.safeArea = (self.tabBarController?.tabBar.frame.height)!
        view.showAni(y: view.safeArea)
        self.view.addSubview(view)
        
        view.showTotal = {
            guard let totalVc = UIStoryboard  (name: "Album", bundle: nil).instantiateViewController(withIdentifier: "total") as? TotalViewController else { return }
            
            totalVc.viewModel.photo = view.viewModel.photo
            
            totalVc.modalPresentationStyle = .overFullScreen
            self.present(totalVc, animated: true, completion: nil)
        }
    }
    
    
    
    
}

