//
//  LogoutViewController.swift
//  KakaoLoginTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/16.
//

import UIKit
import KakaoSDKUser

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
                self.navigationController?.pushViewController(nextVC, animated: true)
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
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
