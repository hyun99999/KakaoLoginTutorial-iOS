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
    
    // MARK: - @IBOutlet Prperties
    
    @IBOutlet weak var loginWithKakaoImageView: UIImageView!
    @IBOutlet weak var loginWithKakaoaccountImageView: UIImageView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ✅ 유효한 토큰 검사
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
                    
                    // ✅ 사용자 정보를 가져오고 화면전환을 하는 커스텀 메서드
                    self.getUserInfo()
                }
            }
        }
        else {
            //로그인 필요
        }
    }
}

// MARK: - Extensions

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
    
    private func getUserInfo() {
        // ✅ 사용자 정보 가져오기
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
                let nickname = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                
                // ✅ 사용자 정보 넘기기
                nextVC.nickname = nickname
                nextVC.email = email
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
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
//                    let kakoOauthToken = oauthToken
                    //UserDefaults.standard.set(kakoOauthToken, forKey: "KakoOauthToken")
                    
                    // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
                    self.getUserInfo()
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
                // _ = oauthToken
                
                // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
                self.getUserInfo()
            }
        }
    }
}
