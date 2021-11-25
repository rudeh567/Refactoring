//
//  ProfileViewModel.swift
//  AgainProject
//
//  Created by yeoboya on 2021/11/24.
//

import Foundation
import Alamofire

class ProfileViewModel {
    
    let defaultImage = "https://mblogthumb-phinf.pstatic.net/20131231_243/qmffhrm3013_1388473525411q2RH8_JPEG/2013-12-31_15%3B46%3B43.jpg?type=w2"
    var member: Member?
    var photo: ProfilePhoto?
    
    func getProfileInfo(completion: ((Bool) -> Void)? = nil) {
        let parms = ["cmd": "getProfile", "gender": "F"]
        let urlString = "https://pida83.gabia.io/api/profile"
        let url = URL(string: urlString)
        
        AF.request(url!, method: .post, parameters: parms, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
                case.success(let response):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
                        let result = try JSONDecoder().decode(ProfileResponse.self, from: data)
                        
                        self.member = result.result.member
                        self.photo = result.result.photo
                        
                        completion?(true)
                    } catch DecodingError.keyNotFound(let key, let context) {
                        print(key,context)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                    case.failure(let err):
                        print(err.localizedDescription)
                    }
        }
        
    }
}
