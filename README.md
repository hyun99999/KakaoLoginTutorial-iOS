# KakaoLoginTutorial-iOS
👷‍♀️ login tutorial using Kakao iOS SDK

### 디자인 가이드

애플 로그인과 동일하게 카카오도 역시 디자인 가이드가 있다. 여기서 PNG 파일을 다운로드 할 수 있다.

[Kakao Developers design-guide](https://developers.kakao.com/docs/latest/ko/reference/design-guide#login-button)

그러면 본격적으로 시작하기전에 설정단계를 알아보자. 아래의 내용들은 카카오 개발자문서를 요약 + 실습이다.

# 👷‍♀️ 설정단계

## 1️⃣ 애플리케이션 등록

카카오 API는 개발자 웹사이트에 등록된 각각의 애플리케이션(이하 앱) 정보 기반으로 동작하므로, 카카오 API를 사용하려면 개발자 웹사이트에 앱을 등록해야 합니다.

### 앱 만들기

카카오 API 사용을 위해 개발자 웹사이트에서 앱을 만들고, 해당 앱에 서비스 이름과 회사명, 아이콘 등 정보를 등록할 수 있습니다. 앱 정보는 서비스 이름, 제3자 정보제공동의 등 법적인 사항과도 관련이 있으므로 실제 서비스와 같은 내용으로 구성되어야 합니다.

개발자 웹사이트에서 로그인한 후, [내 애플리케이션] > [애플리케이션 추가하기]를 눌러 앱을 생성할 수 있습니다.

[카카오계정 로그인](https://developers.kakao.com/console/app)

<img width="500" alt="3" src="https://user-images.githubusercontent.com/69136340/129481023-2b8be054-90ac-4b59-8631-9e4501f16980.png">

### 키 값 확인

앱을 생성하면 플랫폼별 앱 키(App Key)가 발급됩니다. 

Kakao SDK for JavaScript(이하 JavaScript SDK)에는 JavaScript 키, **iOS와 Android에는 네이티브 앱 키**, HTTP 요청이나 서버 기능 구현에는 REST API 키를 각각 사용합니다.

앱 키와 함께 어드민 키(Admin Key)도 함께 발급됩니다. 어드민 키는 [사용자 목록 가져오기](https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#user-list)와 같은 관리 기능을 구현할 때 사용합니다. 

<img width="700" alt="4" src="https://user-images.githubusercontent.com/69136340/129481030-07bcfbc1-8cf7-492f-a4a0-d268ff6e3c41.png">

### 플랫폼 등록

등록한 앱에서 API를 호출하려면 사용하려는 플랫폼에 대한 정보를 개발자 웹사이트에 등록해야 합니다.

<img width="650" alt="5" src="https://user-images.githubusercontent.com/69136340/129481044-3fdead89-ded7-4bc8-89cb-1fd224d1c5d3.png">

iOS 플랫폼에는 다음 정보를 등록해야 합니다.

- 번들 ID(Bundle ID): iOS 앱의 고유 값입니다. Xcode의 프로젝트 정보에 설정된 Bundle Identifier 값과 동일한 값을 입력합니다.
- 앱스토어 ID(Appstore ID): 애플 앱스토어 등록 시 발급받은 앱 ID입니다.
- 마켓 URL(Market URL): 사용자의 기기에서 앱을 실행시킬 때, 사용자의 기기에 해당 앱이 설치되어 있지 않을 경우 이동할 앱스토어 주소입니다. 예를 들어, 사용자가 카카오링크 API나 카카오톡 메시지 API를 통해 전송된 메시지에서 앱을 실행시키는 링크를 눌렀을 때, 앱 실행을 요청한 사용자의 기기에 해당 앱이 설치되어 있지 않으면 지정한 마켓 URL 주소로 이동하여 해당 앱을 다운로드 받을 수 있습니다. 앱스토어 ID를 입력하면 마켓 URL이 자동으로 생성됩니다.

출처 : 

[Kakao Developers getting-started/app](https://developers.kakao.com/docs/latest/ko/getting-started/app)

## 2️⃣ CocoaPods 통해 모듈 설치

```swift
# 전체 추가
pod 'KakaoSDK'

# or

# 필요한 모듈 추가
pod 'KakaoSDKCommon'  # 필수 요소를 담은 공통 모듈
pod 'KakaoSDKAuth'  # 사용자 인증
pod 'KakaoSDKUser'  # 카카오 로그인, 사용자 관리
pod 'KakaoSDKTalk'  # 친구, 메시지(카카오톡)
pod 'KakaoSDKStory'  # 카카오스토리 
pod 'KakaoSDKLink'  # 메시지(카카오링크)
pod 'KakaoSDKTemplate'  # 메시지 템플릿 
pod 'KakaoSDKNavi'  # 카카오내비
```

이뿐만 아니라 RxSwift 도 지원한다.

로그인을 활용하기 위해서 정확히 어떠한 모듈이 필요한지 헷갈려서 pod 'KakaoSDKUser' 만 적어주었더니 이것 외에도 자동으로 필요한 모듈이 install 되었다. 나와 같은 고민으로 걱정하지 않아도 될 것 같다.

<img width="300" alt="1" src="https://user-images.githubusercontent.com/69136340/129481054-f4b56d41-c1ea-4814-a8ee-4123fe775245.png">

## 3️⃣ Info.plist 설정

### 앱 실행 허용 목록 등록하기

iOS 9.0 이상에서 iOS SDK를 통해 카카오톡이나 카카오스토리, 카카오내비 등 애플리케이션(이하 앱)을 실행시키는 기능을 이용하려면 Info.plist 파일에 설정을 추가하여 커스텀 스킴 정보를 등록합니다.

(앱에서 카카오톡앱을 실행시켜 로그인 하는 것과 웹을 통해 카카오 계정으로 로그인 하는 것 둘다 해볼 것이다.)

[Info] > [Custom iOS Target Properties]에 Array 타입 키(Key)인 `LSApplicationQueriesSchemes`를 추가하고, 해당 키의 'Item'으로 커스텀 스킴에 사용할 값인 'kakaokompassauth', 'kakaolink'를 추가합니다.

<img width="800" alt="5" src="https://user-images.githubusercontent.com/69136340/129481071-648e4aaa-3b2a-4f33-a265-ff5f8fbe8335.png">

위 설정은 Info.plist 를 직접 수정해서 적용할 수 있다.

```swift
<key>LSApplicationQueriesSchemes</key>
  <array>
      <!-- 카카오톡으로 로그인 -->
      <string>kakaokompassauth</string>
      <!-- 카카오링크 -->
      <string>kakaolink</string>
  </array>
```

### URL Schemes 설정하기

카카오계정을 통한 인증과 카카오톡 메시지를 통한 앱 실행을 위해 URL Schemes 설정을 합니다.

[Info] > [URL Types] > [URL Schemes] 항목에 네이티브 앱 키(Native App Key)를 `kakao{NATIVE_APP_KEY}` 형식으로 등록합니다.

(앱 등록할 때 발급받았던 네이티브 앱 키를 넣으면 된다.)

<img width="800" alt="6" src="https://user-images.githubusercontent.com/69136340/129481075-b138ba4b-15a6-4d5d-811a-b1b2a07012c4.png">

## 4️⃣ 초기화

iOS 앱에서 iOS SDK를 사용하려면 iOS SDK 파일을 아래와 같이 임포트(import)해야 합니다. 또한 네이티브 앱 키를 사용해 iOS SDK를 초기화하는 과정이 필요합니다. AppDelegate.swift에 Kakao SDK를 초기화하는 코드를 추가합니다.

```swift
import KakaoSDKCommon

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

  ...
  KakaoSDKCommon.initSDK(appKey: "NATIVE_APP_KEY")
  ...

}
```

출처 :

[Kakao Developers getting-started/sdk-ios](https://developers.kakao.com/docs/latest/ko/getting-started/sdk-ios)

# 👷‍♀️ 시작하기 전에

**두가지 방법으로 로그인을 한다고 예고했는데 자세히 알아보자.**

### 카카오톡으로 로그인

카카오톡으로 로그인하는 방법은 카카오톡에 연결된 카카오계정 및 인증 정보를 사용합니다. 사용자가 카카오계정 정보를 직접 입력하지 않아도 간편하게 로그인할 수 있어 보다 권장되는 인증 방법입니다.

### 기본 웹 브라우저(Default Browser)를 통해 카카오계정으로 로그인

기본 웹 브라우저를 통해 카카오계정 정보를 입력하고 로그인할 경우, 사용자가 카카오계정 정보를 직접 입력하는 단계를 거칩니다. 이 방법은 사용자가 여러 개의 카카오계정을 사용하는 서비스나 카카오톡을 지원하지 않는 디바이스에서 사용하는 것이 좋습니다.

> 각 인증 방법의 특징과 서비스의 사용자 로그인 동선을 고려하여 어느 인증 방법이 적합한지 판단합니다. 두 가지 인증 방법을 함께 사용할 수도 있습니다. 인증 방법에 따라 필요한 설정이나 예외 처리에 차이가 있습니다.

### ❗️ 카카오톡으로 로그인을 위한 설정

**카카오톡으로 로그인** 기능을 구현하기 위한 필수 설정입니다.

카카오톡으로 로그인은 서비스 앱에서 카카오톡으로 이동한 후, 사용자가 [동의하고 계속하기] 버튼 또는 로그인 취소 버튼을 누르면 다시 카카오톡에서 서비스 앱으로 이동하는 과정을 거칩니다. 

- SceneDelegate.swift 파일에 handleOpenUrl()을 추가합니다.

```swift
import KakaoSDKAuth
...

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    ...
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    ...
}
```

# 👷‍♀️ 시작하기

- Main.storyboard

다음과 같은 스토리보드에서 실습할 것이다.

<img width="800" alt="스크린샷 2021-08-16 오후 3 41 51" src="https://user-images.githubusercontent.com/69136340/129530561-62e84f7b-7903-4502-8d38-17ce9d32aeb7.png">

## 📌 카카오톡으로 로그인

### 1️⃣  기능구현

```swift
// ✅ 모듈 추가
import KakaoSDKUser

// ...

// ✅ 카카오로그인 이미지에 UITapGestureRecognizer 를 등록할 때 사용할 @objc 메서드.
// ✅ 카카오톡으로 로그인
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
                    
                    // ✅ 회원가입 성공 시 oauthToken 저장가능하다
                    // _ = oauthToken
                    
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
```

카카오톡이 설치되있지 않으면 다음과 같은 오류를 보여준다. 핸드폰에 연결해서 실습해야한다.

<img width="700" alt="7" src="https://user-images.githubusercontent.com/69136340/129530607-0df6dbf4-ef75-41da-91d1-70e9fe977ae9.png">

### 2️⃣ 핸드폰에서 빌드

<img src ="https://user-images.githubusercontent.com/69136340/129530630-d8a604e1-c943-4369-8dcf-b485ddd5bfb5.PNG" width ="250">

<img src ="https://user-images.githubusercontent.com/69136340/129530637-c95e7a80-4adb-4dfa-b6dd-9874b8bfd760.PNG" width ="250">


처음에 시도하면 이런 화면이 나올텐데 Kakao developers 의 [내 어플리케이션] > [제품설정] > [카카오 로그인] 에서 카카오 로그인을 활성화를 해주어야만 실제 서비스에서 사용할 수 있다.

<img width="800" alt="10" src="https://user-images.githubusercontent.com/69136340/129530654-02fd92ba-c644-423f-bb52-11a1700f8779.png">

이와 같이 활성화를 해주면 다음과 같이 로그인 화면이 보여진다.

<img src ="https://user-images.githubusercontent.com/69136340/129530746-03c228ff-c7f6-44ed-8334-180d7bda7bba.jpeg" width ="250">

## 📌  카카오계정으로 로그인

### 1️⃣ 기능구현

```swift
// ✅ 모듈 추가
import KakaoSDKUser

// ...

// ✅ 카카오로그인 이미지에 UITapGestureRecognizer 를 등록할 때 사용할 @objc 메서드.
// ✅ 카카오계정으로 로그인
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
```

카카오계정으로 로그인도 잘되는지 확인해보겠다.

<img src ="https://user-images.githubusercontent.com/69136340/129530798-e64745bb-3fb4-403f-94ab-b2aa3428ac41.jpeg" width ="250">

## 📌  동의 항목 설정

처음에는 동의항목이 하나도 설정되어 있지 않은 것을 확인할 수 있다. 이것은 Kakao Developer 에서 설정가능하다.

<img width="800" alt="스크린샷 2021-08-16 오후 3 09 40" src="https://user-images.githubusercontent.com/69136340/129530846-00ddd4de-6414-46a7-a4e3-670a9f1e0d77.png">

이메일 경우는 필수동의를 받기위해서는 검수를 필요했다. 그래서 닉네임은 필수동의, 이메일은 선택동의로 동의를 받아보겠다.

<img src ="https://user-images.githubusercontent.com/69136340/129530853-51cef447-4e27-4c8b-961b-e2e88e8d3f84.PNG" width ="250">

## 📌 로그아웃 & 연결 끊기

- 로그아웃 : 로그아웃 API는 토큰을 삭제하여, 더 이상 해당 사용자 정보로 카카오 API를 호출할 수 없도록 합니다.
- 연결끊기 : 연결 끊기 API는 카카오 플랫폼 안에서 앱과 사용자 카카오계정의 연결 상태를 해제합니다.

- LogoutViewController.swift

```swift
import UIKit
import KakaoSDKUser

class LogoutViewController: UIViewController {
    
    // ...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ...
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
    // ...
}
```

## 📌 사용자 정보 가져오기

닉네임(`user.kakaoAccount.profile.nickname`)과 이메일(`user.kakaoAccount.email`)을 가져와 보도록 하겠다.

```swift
extension LoginViewController {

// ✅ 사용자 정보를 성공적으로 가져오면 화면전환 한다.
    private func getUserInfo() {

        // ✅ 사용자 정보 가져오기
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                // ✅ 닉네임, 이메일 정보
                let nickname = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                
                // ✅ 사용자 정보 넘기기
                nextVC.nickname = nickname
                nextVC.email = email

                // ✅ 화면전환
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
```

각 항목의 자료형 등은 아래를 참고해서 가져올 수 있다.

[Kakao Developers](https://developers.kakao.com/sdk/reference/ios/release/KakaoSDKUser/Structs/User.html)

## 📌 토큰 존재 여부 확인하기

토큰의 존재 여부를 확인해서 앱 실행 시 회원가입을 시킬지 메인화면으로 보낼지 분기처리할 수 있다.

- 뷰가 다 보여진 후 토큰을 검사해서 유효성이 확인되면 로그인된 화면으로 전환해주었다. (AppDelegate.swift 에서 앱 실행 시 첫 화면의 분기처리를 위해서 사용해주어도 된다.)

```swift
import UIKit
// ✅ 모듈 추가
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class LoginViewController: UIViewController {

// ...

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
```

출처 : 

[Kakao Developers kakaologin/ios](https://developers.kakao.com/docs/latest/ko/kakaologin/ios)
