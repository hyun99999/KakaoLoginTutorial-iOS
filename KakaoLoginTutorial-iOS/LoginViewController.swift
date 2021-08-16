//
//  ViewController.swift
//  KakaoLoginTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/15.
//

import UIKit
// ✅ 모듈 추가
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class LoginViewController: UIViewController {
    @IBOutlet weak var loginWithKakaoImageView: UIImageView!
    @IBOutlet weak var loginWithKakaoaccountImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // ✅ 유효한 토큰 검사
        
        let kakaoOauthToken = UserDefaults.standard.string(forKey: "KakaoOauthToken") ?? ""
        print("kakaoOauthToken: \(kakaoOauthToken)")
        
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
                    }
                    else {
                        //기타 에러
                    }
                }
                else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    // ✅ 토큰이 유효하면 로그인된 화면으로 보낸다.
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
        else {
            //로그인 필요
        }
    }
}

extension LoginViewController {
    
    // MARK: - Methods
    
    private func setUI() {
        
        // ✅ 카카오 로그인 이미지 설정
        loginWithKakaoImageView.contentMode = .scaleAspectFit
        loginWithKakaoImageView.image = UIImage(named: "kakao_login_large_wide")
        
        loginWithKakaoaccountImageView.contentMode = .scaleAspectFit
        loginWithKakaoaccountImageView.image = UIImage(named: "kakao_login_large_wide")
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // ✅ 이미지뷰에 제스쳐 추가
    private func setGestureRecognizer() {
        let loginKakao = UITapGestureRecognizer(target: self, action: #selector(loginKakao))
        loginWithKakaoImageView.isUserInteractionEnabled = true
        loginWithKakaoImageView.addGestureRecognizer(loginKakao)
        
        let loginKakaoAccount = UITapGestureRecognizer(target: self, action: #selector(loginKakaoAccount))
        loginWithKakaoaccountImageView.isUserInteractionEnabled = true
        loginWithKakaoaccountImageView.addGestureRecognizer(loginKakaoAccount)
    }
    
    // MARK: - @objc Methods
    
    // ✅ 회원가입 구현
    @objc
    func loginKakao() {
        print("loginKakao() called.")
        
        // ✅ 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // ✅ 회원가입 성공 시 oauthToken 저장
                    let kakoOauthToken = oauthToken
                    //                    UserDefaults.standard.set(kakoOauthToken, forKey: "KakoOauthToken")
                    
                    // ✅ 화면전환
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    
                }
            }
        }
        // ✅ 카카오톡 미설치
        else {
            print("카카오톡 미설치")
        }
    }
    
    @objc
    func loginKakaoAccount() {
        print("loginKakaoAccount() called.")
        
        // ✅ 기본 웹 브라우저를 사용하여 로그인 진행.
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                // ✅ 회원가입 성공 시 oauthToken 저장
                let kakoOauthToken = oauthToken
//                UserDefaults.standard.set(kakoOauthToken, forKey: "KakoOauthToken")
                
                // ✅ 화면전환
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
