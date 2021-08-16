//
//  LogoutViewController.swift
//  KakaoLoginTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/16.
//

import UIKit
import KakaoSDKUser

class LogoutViewController: UIViewController {

    
    @IBOutlet weak var nicknameText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    
    var nickname: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func logoutClicked(_ sender: Any) {
        
        // ✅ 로그아웃 : 로그아웃은 API 요청의 성공 여부와 관계없이 토큰을 삭제 처리한다는 점에 유의합니다.
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                
                // ✅ 로그아웃 시 메인으로 보냄
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    @IBAction func unlinkClicked(_ sender: Any) {
        
        // ✅ 연결 끊기 : 연결이 끊어지면 기존의 토큰은 더 이상 사용할 수 없으므로, 연결 끊기 API 요청 성공 시 로그아웃 처리가 함께 이뤄져 토큰이 삭제됩니다.
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
                
                // ✅ 연결끊기 시 메인으로 보냄
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension LogoutViewController {
    private func setUI() {
        // ✅ 사용자 정보 보여주기
        if let nickname = nickname {
            nicknameText.text = "\(nickname)님 환영합니다."
        }
        // ✅ 닉네임의 경우 필수동의 항목이라서 else 문이 필요하지 않았다.

        if let emial = email {
            emailText.text = "\(emial)님 환영합니다."
        } else {
            emailText.text = "이메일 정보 수집을 동의하십시오."
        }
    }
}
