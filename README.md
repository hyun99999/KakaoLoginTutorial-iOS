# KakaoLoginTutorial-iOS
👷‍♀️ login tutorial using Kakao iOS SDK

### 디자인 가이드

애플 로그인과 동일하게 카카오도 역시 디자인 가이드가 있다. 여기서 PNG 파일을 다운로드 할 수 있다.

[Kakao Developers](https://developers.kakao.com/docs/latest/ko/reference/design-guide#login-button)

그러면 본격적으로 시작하기전에 설정단계를 알아보자. 아래의 내용들은 카카오 개발자문서를 요약 + 실습이다.

# 💡 설정단계

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

[Kakao Developers](https://developers.kakao.com/docs/latest/ko/getting-started/app)

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

[Kakao Developers](https://developers.kakao.com/docs/latest/ko/getting-started/sdk-ios)

# 💡 시작하기 전에

**두가지 방법으로 로그인을 한다고 예고했는데 자세히 알아보자.**

### 카카오톡으로 로그인

카카오톡으로 로그인하는 방법은 카카오톡에 연결된 카카오계정 및 인증 정보를 사용합니다. 사용자가 카카오계정 정보를 직접 입력하지 않아도 간편하게 로그인할 수 있어 보다 권장되는 인증 방법입니다.

### 기본 웹 브라우저(Default Browser)를 통해 카카오계정으로 로그인

기본 웹 브라우저를 통해 카카오계정 정보를 입력하고 로그인할 경우, 사용자가 카카오계정 정보를 직접 입력하는 단계를 거칩니다. 이 방법은 사용자가 여러 개의 카카오계정을 사용하는 서비스나 카카오톡을 지원하지 않는 디바이스에서 사용하는 것이 좋습니다.

> 각 인증 방법의 특징과 서비스의 사용자 로그인 동선을 고려하여 어느 인증 방법이 적합한지 판단합니다. 두 가지 인증 방법을 함께 사용할 수도 있습니다. 인증 방법에 따라 필요한 설정이나 예외 처리에 차이가 있으므로, 인증 방법별 개발 가이드를 참고합니다.

### ❗️ 카카오톡으로 로그인을 위한 설정

**카카오톡으로 로그인** 기능을 구현하기 위한 필수 설정입니다.

카카오톡으로 로그인은 서비스 앱에서 카카오톡으로 이동한 후, 사용자가 [동의하고 계속하기] 버튼 또는 로그인 취소 버튼을 누르면 다시 카카오톡에서 서비스 앱으로 이동하는 과정을 거칩니다. 카카오톡에서 서비스 앱으로 돌아왔을 때 카카오 로그인 처리를 정상적으로 완료하기 위해 AppDelegate.swift 파일에 `handleOpenUrl()` 을 추가합니다.

```swift
import KakaoSDKAuth
...

class AppDelegate: UIResponder, UIApplicationDelegate {
    ...
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

        return false
    }
    ...
}
```

# 시작하기

...
