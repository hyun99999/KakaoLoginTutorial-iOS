# KakaoLoginTutorial-iOS
๐ทโโ๏ธ login tutorial using Kakao iOS SDK

<img src ="https://user-images.githubusercontent.com/69136340/129535136-1af844fa-ae83-474a-b9be-c18012a2c977.gif" width ="250">

# **๋ชฉ์ฐจ**
- ๋์์ธ ๊ฐ์ด๋

- [์ค์ ๋จ๊ณ](#์ค์ ๋จ๊ณ)
  - ์ ํ๋ฆฌ์ผ์ด์ ๋ฑ๋ก
  - CocoaPods ํตํด ๋ชจ๋ ์ค์น
  - Info.plist ์ค์ 
  - ์ด๊ธฐํ

- [์์ํ๊ธฐ ์ ](#์์ํ๊ธฐ-์ )
  - ์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ
  - ๊ธฐ๋ณธ ์น ๋ธ๋ผ์ฐ์ ๋ฅผ ํตํด ์นด์นด์ค๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ

- [์์ํ๊ธฐ](#์์ํ๊ธฐ)
  - [์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ](#๐-์นด์นด์คํก์ผ๋ก-๋ก๊ทธ์ธ)
  - [์นด์นด์คํก๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ](#๐-์นด์นด์คํก๊ณ์ ์ผ๋ก-๋ก๊ทธ์ธ)
  - [๋์ ํญ๋ชฉ ์ค์ ](#๐-๋์-ํญ๋ชฉ-์ค์ )
  - [๋ก๊ทธ์์ & ์ฐ๊ฒฐ ๋๊ธฐ](#๐-๋ก๊ทธ์์-&-์ฐ๊ฒฐ-๋๊ธฐ)
  - [์ฌ์ฉ์ ์ ๋ณด ๊ฐ์ ธ์ค๊ธฐ](#๐-์ฌ์ฉ์-์ ๋ณด-๊ฐ์ ธ์ค๊ธฐ)
  - [ํ ํฐ ์กด์ฌ ์ฌ๋ถ ํ์ธํ๊ธฐ](#๐-ํ ํฐ-์กด์ฌ-์ฌ๋ถ-ํ์ธํ๊ธฐ)

### ๋์์ธ ๊ฐ์ด๋

์ ํ ๋ก๊ทธ์ธ๊ณผ ๋์ผํ๊ฒ ์นด์นด์ค๋ ์ญ์ ๋์์ธ ๊ฐ์ด๋๊ฐ ์๋ค. ์ฌ๊ธฐ์ PNG ํ์ผ์ ๋ค์ด๋ก๋ ํ  ์ ์๋ค.

[Kakao Developers design-guide](https://developers.kakao.com/docs/latest/ko/reference/design-guide#login-button)

๊ทธ๋ฌ๋ฉด ๋ณธ๊ฒฉ์ ์ผ๋ก ์์ํ๊ธฐ์ ์ ์ค์ ๋จ๊ณ๋ฅผ ์์๋ณด์. ์๋์ ๋ด์ฉ๋ค์ ์นด์นด์ค ๊ฐ๋ฐ์๋ฌธ์๋ฅผ ์์ฝ + ์ค์ต์ด๋ค.

# ์ค์ ๋จ๊ณ

## 1๏ธโฃ ์ ํ๋ฆฌ์ผ์ด์ ๋ฑ๋ก

์นด์นด์ค API๋ ๊ฐ๋ฐ์ ์น์ฌ์ดํธ์ ๋ฑ๋ก๋ ๊ฐ๊ฐ์ ์ ํ๋ฆฌ์ผ์ด์(์ดํ ์ฑ) ์ ๋ณด ๊ธฐ๋ฐ์ผ๋ก ๋์ํ๋ฏ๋ก, ์นด์นด์ค API๋ฅผ ์ฌ์ฉํ๋ ค๋ฉด ๊ฐ๋ฐ์ ์น์ฌ์ดํธ์ ์ฑ์ ๋ฑ๋กํด์ผ ํฉ๋๋ค.

### ์ฑ ๋ง๋ค๊ธฐ

์นด์นด์ค API ์ฌ์ฉ์ ์ํด ๊ฐ๋ฐ์ ์น์ฌ์ดํธ์์ ์ฑ์ ๋ง๋ค๊ณ , ํด๋น ์ฑ์ ์๋น์ค ์ด๋ฆ๊ณผ ํ์ฌ๋ช, ์์ด์ฝ ๋ฑ ์ ๋ณด๋ฅผ ๋ฑ๋กํ  ์ ์์ต๋๋ค. ์ฑ ์ ๋ณด๋ ์๋น์ค ์ด๋ฆ, ์ 3์ ์ ๋ณด์ ๊ณต๋์ ๋ฑ ๋ฒ์ ์ธ ์ฌํญ๊ณผ๋ ๊ด๋ จ์ด ์์ผ๋ฏ๋ก ์ค์  ์๋น์ค์ ๊ฐ์ ๋ด์ฉ์ผ๋ก ๊ตฌ์ฑ๋์ด์ผ ํฉ๋๋ค.

๊ฐ๋ฐ์ ์น์ฌ์ดํธ์์ ๋ก๊ทธ์ธํ ํ, [๋ด ์ ํ๋ฆฌ์ผ์ด์] > [์ ํ๋ฆฌ์ผ์ด์ ์ถ๊ฐํ๊ธฐ]๋ฅผ ๋๋ฌ ์ฑ์ ์์ฑํ  ์ ์์ต๋๋ค.

[์นด์นด์ค๊ณ์  ๋ก๊ทธ์ธ](https://developers.kakao.com/console/app)

<img width="500" alt="3" src="https://user-images.githubusercontent.com/69136340/129481023-2b8be054-90ac-4b59-8631-9e4501f16980.png">

### ํค ๊ฐ ํ์ธ

์ฑ์ ์์ฑํ๋ฉด ํ๋ซํผ๋ณ ์ฑ ํค(App Key)๊ฐ ๋ฐ๊ธ๋ฉ๋๋ค. 

Kakao SDK for JavaScript(์ดํ JavaScript SDK)์๋ JavaScript ํค, **iOS์ Android์๋ ๋ค์ดํฐ๋ธ ์ฑ ํค**, HTTP ์์ฒญ์ด๋ ์๋ฒ ๊ธฐ๋ฅ ๊ตฌํ์๋ REST API ํค๋ฅผ ๊ฐ๊ฐ ์ฌ์ฉํฉ๋๋ค.

์ฑ ํค์ ํจ๊ป ์ด๋๋ฏผ ํค(Admin Key)๋ ํจ๊ป ๋ฐ๊ธ๋ฉ๋๋ค. ์ด๋๋ฏผ ํค๋ [์ฌ์ฉ์ ๋ชฉ๋ก ๊ฐ์ ธ์ค๊ธฐ](https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#user-list)์ ๊ฐ์ ๊ด๋ฆฌ ๊ธฐ๋ฅ์ ๊ตฌํํ  ๋ ์ฌ์ฉํฉ๋๋ค. 

<img width="700" alt="4" src="https://user-images.githubusercontent.com/69136340/129481030-07bcfbc1-8cf7-492f-a4a0-d268ff6e3c41.png">

### ํ๋ซํผ ๋ฑ๋ก

๋ฑ๋กํ ์ฑ์์ API๋ฅผ ํธ์ถํ๋ ค๋ฉด ์ฌ์ฉํ๋ ค๋ ํ๋ซํผ์ ๋ํ ์ ๋ณด๋ฅผ ๊ฐ๋ฐ์ ์น์ฌ์ดํธ์ ๋ฑ๋กํด์ผ ํฉ๋๋ค.

<img width="650" alt="5" src="https://user-images.githubusercontent.com/69136340/129481044-3fdead89-ded7-4bc8-89cb-1fd224d1c5d3.png">

iOS ํ๋ซํผ์๋ ๋ค์ ์ ๋ณด๋ฅผ ๋ฑ๋กํด์ผ ํฉ๋๋ค.

- ๋ฒ๋ค ID(Bundle ID): iOS ์ฑ์ ๊ณ ์  ๊ฐ์๋๋ค. Xcode์ ํ๋ก์ ํธ ์ ๋ณด์ ์ค์ ๋ Bundle Identifier ๊ฐ๊ณผ ๋์ผํ ๊ฐ์ ์๋ ฅํฉ๋๋ค.
- ์ฑ์คํ ์ด ID(Appstore ID): ์ ํ ์ฑ์คํ ์ด ๋ฑ๋ก ์ ๋ฐ๊ธ๋ฐ์ ์ฑ ID์๋๋ค.
- ๋ง์ผ URL(Market URL): ์ฌ์ฉ์์ ๊ธฐ๊ธฐ์์ ์ฑ์ ์คํ์ํฌ ๋, ์ฌ์ฉ์์ ๊ธฐ๊ธฐ์ ํด๋น ์ฑ์ด ์ค์น๋์ด ์์ง ์์ ๊ฒฝ์ฐ ์ด๋ํ  ์ฑ์คํ ์ด ์ฃผ์์๋๋ค. ์๋ฅผ ๋ค์ด, ์ฌ์ฉ์๊ฐ ์นด์นด์ค๋งํฌ API๋ ์นด์นด์คํก ๋ฉ์์ง API๋ฅผ ํตํด ์ ์ก๋ ๋ฉ์์ง์์ ์ฑ์ ์คํ์ํค๋ย ๋งํฌ๋ฅผ ๋๋ ์ ๋, ์ฑ ์คํ์ ์์ฒญํ ์ฌ์ฉ์์ ๊ธฐ๊ธฐ์ ํด๋น ์ฑ์ด ์ค์น๋์ด ์์ง ์์ผ๋ฉด ์ง์ ํ ๋ง์ผ URL ์ฃผ์๋ก ์ด๋ํ์ฌ ํด๋น ์ฑ์ ๋ค์ด๋ก๋ ๋ฐ์ ์ ์์ต๋๋ค. ์ฑ์คํ ์ด ID๋ฅผ ์๋ ฅํ๋ฉด ๋ง์ผ URL์ด ์๋์ผ๋ก ์์ฑ๋ฉ๋๋ค.

์ถ์ฒ : 

[Kakao Developers getting-started/app](https://developers.kakao.com/docs/latest/ko/getting-started/app)

## 2๏ธโฃ CocoaPods ํตํด ๋ชจ๋ ์ค์น

```swift
# ์ ์ฒด ์ถ๊ฐ
pod 'KakaoSDK'

# or

# ํ์ํ ๋ชจ๋ ์ถ๊ฐ
pod 'KakaoSDKCommon'  # ํ์ ์์๋ฅผ ๋ด์ ๊ณตํต ๋ชจ๋
pod 'KakaoSDKAuth'  # ์ฌ์ฉ์ ์ธ์ฆ
pod 'KakaoSDKUser'  # ์นด์นด์ค ๋ก๊ทธ์ธ, ์ฌ์ฉ์ ๊ด๋ฆฌ
pod 'KakaoSDKTalk'  # ์น๊ตฌ, ๋ฉ์์ง(์นด์นด์คํก)
pod 'KakaoSDKStory'  # ์นด์นด์ค์คํ ๋ฆฌ 
pod 'KakaoSDKLink'  # ๋ฉ์์ง(์นด์นด์ค๋งํฌ)
pod 'KakaoSDKTemplate'  # ๋ฉ์์ง ํํ๋ฆฟ 
pod 'KakaoSDKNavi'  # ์นด์นด์ค๋ด๋น
```

์ด๋ฟ๋ง ์๋๋ผ RxSwift ๋ ์ง์ํ๋ค.

๋ก๊ทธ์ธ์ ํ์ฉํ๊ธฐ ์ํด์ ์ ํํ ์ด๋ ํ ๋ชจ๋์ด ํ์ํ์ง ํท๊ฐ๋ ค์ pod 'KakaoSDKUser' ๋ง ์ ์ด์ฃผ์๋๋ ์ด๊ฒ ์ธ์๋ ์๋์ผ๋ก ํ์ํ ๋ชจ๋์ด install ๋์๋ค. ๋์ ๊ฐ์ ๊ณ ๋ฏผ์ผ๋ก ๊ฑฑ์ ํ์ง ์์๋ ๋  ๊ฒ ๊ฐ๋ค.

<img width="300" alt="1" src="https://user-images.githubusercontent.com/69136340/129481054-f4b56d41-c1ea-4814-a8ee-4123fe775245.png">

## 3๏ธโฃ Info.plist ์ค์ 

### ์ฑ ์คํ ํ์ฉ ๋ชฉ๋ก ๋ฑ๋กํ๊ธฐ

iOS 9.0 ์ด์์์ iOS SDK๋ฅผ ํตํด ์นด์นด์คํก์ด๋ ์นด์นด์ค์คํ ๋ฆฌ, ์นด์นด์ค๋ด๋น ๋ฑ ์ ํ๋ฆฌ์ผ์ด์(์ดํ ์ฑ)์ ์คํ์ํค๋ ๊ธฐ๋ฅ์ ์ด์ฉํ๋ ค๋ฉด Info.plist ํ์ผ์ ์ค์ ์ ์ถ๊ฐํ์ฌ ์ปค์คํ ์คํด ์ ๋ณด๋ฅผ ๋ฑ๋กํฉ๋๋ค.

(์ฑ์์ ์นด์นด์คํก์ฑ์ ์คํ์์ผ ๋ก๊ทธ์ธ ํ๋ ๊ฒ๊ณผ ์น์ ํตํด ์นด์นด์ค ๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ ํ๋ ๊ฒ ๋๋ค ํด๋ณผ ๊ฒ์ด๋ค.)

[Info] > [Custom iOS Target Properties]์ Array ํ์ ํค(Key)์ธ `LSApplicationQueriesSchemes`๋ฅผ ์ถ๊ฐํ๊ณ , ํด๋น ํค์ 'Item'์ผ๋ก ์ปค์คํ ์คํด์ ์ฌ์ฉํ  ๊ฐ์ธ 'kakaokompassauth', 'kakaolink'๋ฅผ ์ถ๊ฐํฉ๋๋ค.

<img width="800" alt="5" src="https://user-images.githubusercontent.com/69136340/129481071-648e4aaa-3b2a-4f33-a265-ff5f8fbe8335.png">

์ ์ค์ ์ Info.plist ๋ฅผ ์ง์  ์์ ํด์ ์ ์ฉํ  ์ ์๋ค.

```swift
<key>LSApplicationQueriesSchemes</key>
  <array>
      <!-- ์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ -->
      <string>kakaokompassauth</string>
      <!-- ์นด์นด์ค๋งํฌ -->
      <string>kakaolink</string>
  </array>
```

### URL Schemes ์ค์ ํ๊ธฐ

์นด์นด์ค๊ณ์ ์ ํตํ ์ธ์ฆ๊ณผ ์นด์นด์คํก ๋ฉ์์ง๋ฅผ ํตํ ์ฑ ์คํ์ ์ํด URL Schemes ์ค์ ์ ํฉ๋๋ค.

[Info] > [URL Types] > [URL Schemes] ํญ๋ชฉ์ ๋ค์ดํฐ๋ธ ์ฑ ํค(Native App Key)๋ฅผ `kakao{NATIVE_APP_KEY}` ํ์์ผ๋ก ๋ฑ๋กํฉ๋๋ค.

(์ฑ ๋ฑ๋กํ  ๋ ๋ฐ๊ธ๋ฐ์๋ ๋ค์ดํฐ๋ธ ์ฑ ํค๋ฅผ ๋ฃ์ผ๋ฉด ๋๋ค.)

<img width="800" alt="6" src="https://user-images.githubusercontent.com/69136340/129481075-b138ba4b-15a6-4d5d-811a-b1b2a07012c4.png">

## 4๏ธโฃ ์ด๊ธฐํ

iOS ์ฑ์์ iOS SDK๋ฅผ ์ฌ์ฉํ๋ ค๋ฉด iOS SDK ํ์ผ์ ์๋์ ๊ฐ์ด ์ํฌํธ(import)ํด์ผ ํฉ๋๋ค. ๋ํ ๋ค์ดํฐ๋ธ ์ฑ ํค๋ฅผ ์ฌ์ฉํด iOS SDK๋ฅผ ์ด๊ธฐํํ๋ ๊ณผ์ ์ด ํ์ํฉ๋๋ค. AppDelegate.swift์ Kakao SDK๋ฅผ ์ด๊ธฐํํ๋ ์ฝ๋๋ฅผ ์ถ๊ฐํฉ๋๋ค.

```swift
import KakaoSDKCommon

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

  ...
  KakaoSDKCommon.initSDK(appKey: "NATIVE_APP_KEY")
  ...

}
```

์ถ์ฒ :

[Kakao Developers getting-started/sdk-ios](https://developers.kakao.com/docs/latest/ko/getting-started/sdk-ios)

# ์์ํ๊ธฐ ์ 

**๋๊ฐ์ง ๋ฐฉ๋ฒ์ผ๋ก ๋ก๊ทธ์ธ์ ํ๋ค๊ณ  ์๊ณ ํ๋๋ฐ ์์ธํ ์์๋ณด์.**

### ์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ

์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธํ๋ ๋ฐฉ๋ฒ์ ์นด์นด์คํก์ ์ฐ๊ฒฐ๋ ์นด์นด์ค๊ณ์  ๋ฐ ์ธ์ฆ ์ ๋ณด๋ฅผ ์ฌ์ฉํฉ๋๋ค. ์ฌ์ฉ์๊ฐ ์นด์นด์ค๊ณ์  ์ ๋ณด๋ฅผ ์ง์  ์๋ ฅํ์ง ์์๋ ๊ฐํธํ๊ฒ ๋ก๊ทธ์ธํ  ์ ์์ด ๋ณด๋ค ๊ถ์ฅ๋๋ ์ธ์ฆ ๋ฐฉ๋ฒ์๋๋ค.

### ๊ธฐ๋ณธ ์น ๋ธ๋ผ์ฐ์ (Default Browser)๋ฅผ ํตํด ์นด์นด์ค๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ

๊ธฐ๋ณธ ์น ๋ธ๋ผ์ฐ์ ๋ฅผ ํตํด ์นด์นด์ค๊ณ์  ์ ๋ณด๋ฅผ ์๋ ฅํ๊ณ  ๋ก๊ทธ์ธํ  ๊ฒฝ์ฐ, ์ฌ์ฉ์๊ฐ ์นด์นด์ค๊ณ์  ์ ๋ณด๋ฅผ ์ง์  ์๋ ฅํ๋ ๋จ๊ณ๋ฅผ ๊ฑฐ์นฉ๋๋ค. ์ด ๋ฐฉ๋ฒ์ ์ฌ์ฉ์๊ฐ ์ฌ๋ฌ ๊ฐ์ ์นด์นด์ค๊ณ์ ์ ์ฌ์ฉํ๋ ์๋น์ค๋ ์นด์นด์คํก์ ์ง์ํ์ง ์๋ ๋๋ฐ์ด์ค์์ ์ฌ์ฉํ๋ ๊ฒ์ด ์ข์ต๋๋ค.

> ๊ฐ ์ธ์ฆ ๋ฐฉ๋ฒ์ ํน์ง๊ณผ ์๋น์ค์ ์ฌ์ฉ์ ๋ก๊ทธ์ธ ๋์ ์ ๊ณ ๋ คํ์ฌ ์ด๋ ์ธ์ฆ ๋ฐฉ๋ฒ์ด ์ ํฉํ์ง ํ๋จํฉ๋๋ค. ๋ ๊ฐ์ง ์ธ์ฆ ๋ฐฉ๋ฒ์ ํจ๊ป ์ฌ์ฉํ  ์๋ ์์ต๋๋ค. ์ธ์ฆ ๋ฐฉ๋ฒ์ ๋ฐ๋ผ ํ์ํ ์ค์ ์ด๋ ์์ธ ์ฒ๋ฆฌ์ ์ฐจ์ด๊ฐ ์์ต๋๋ค.

### โ๏ธ ์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ์ ์ํ ์ค์ 

**์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ** ๊ธฐ๋ฅ์ ๊ตฌํํ๊ธฐ ์ํ ํ์ ์ค์ ์๋๋ค.

์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ์ ์๋น์ค ์ฑ์์ ์นด์นด์คํก์ผ๋ก ์ด๋ํ ํ, ์ฌ์ฉ์๊ฐ [๋์ํ๊ณ  ๊ณ์ํ๊ธฐ] ๋ฒํผ ๋๋ ๋ก๊ทธ์ธ ์ทจ์ ๋ฒํผ์ ๋๋ฅด๋ฉด ๋ค์ ์นด์นด์คํก์์ ์๋น์ค ์ฑ์ผ๋ก ์ด๋ํ๋ ๊ณผ์ ์ ๊ฑฐ์นฉ๋๋ค. 

- SceneDelegate.swift ํ์ผ์ handleOpenUrl()์ ์ถ๊ฐํฉ๋๋ค.

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

# ์์ํ๊ธฐ

- Main.storyboard

๋ค์๊ณผ ๊ฐ์ ์คํ ๋ฆฌ๋ณด๋์์ ์ค์ตํ  ๊ฒ์ด๋ค.

<img width="800" alt="แแณแแณแแตแซแแฃแบ 2021-08-16 แแฉแแฎ 3 41 51" src="https://user-images.githubusercontent.com/69136340/129530561-62e84f7b-7903-4502-8d38-17ce9d32aeb7.png">

## ๐ ์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ

### 1๏ธโฃ  ๊ธฐ๋ฅ๊ตฌํ

```swift
// โ ๋ชจ๋ ์ถ๊ฐ
import KakaoSDKUser

// ...

// โ ์นด์นด์ค๋ก๊ทธ์ธ ์ด๋ฏธ์ง์ UITapGestureRecognizer ๋ฅผ ๋ฑ๋กํ  ๋ ์ฌ์ฉํ  @objc ๋ฉ์๋.
// โ ์นด์นด์คํก์ผ๋ก ๋ก๊ทธ์ธ
    @objc
    func loginKakao() {
        print("loginKakao() called.")
        
        // โ ์นด์นด์คํก ์ค์น ์ฌ๋ถ ํ์ธ
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // โ ํ์๊ฐ์ ์ฑ๊ณต ์ oauthToken ์ ์ฅ๊ฐ๋ฅํ๋ค
                    // _ = oauthToken
                    
                    // โ ์ฌ์ฉ์์ ๋ณด๋ฅผ ์ฑ๊ณต์ ์ผ๋ก ๊ฐ์ ธ์ค๋ฉด ํ๋ฉด์ ํ ํ๋ค.
                    self.getUserInfo()
                }
            }
        }
        // โ ์นด์นด์คํก ๋ฏธ์ค์น
        else {
            print("์นด์นด์คํก ๋ฏธ์ค์น")
        }
    }
```

์นด์นด์คํก์ด ์ค์น๋์์ง ์์ผ๋ฉด ๋ค์๊ณผ ๊ฐ์ ์ค๋ฅ๋ฅผ ๋ณด์ฌ์ค๋ค. ํธ๋ํฐ์ ์ฐ๊ฒฐํด์ ์ค์ตํด์ผํ๋ค.

<img width="700" alt="7" src="https://user-images.githubusercontent.com/69136340/129530607-0df6dbf4-ef75-41da-91d1-70e9fe977ae9.png">

### 2๏ธโฃ ํธ๋ํฐ์์ ๋น๋

<img src ="https://user-images.githubusercontent.com/69136340/129530630-d8a604e1-c943-4369-8dcf-b485ddd5bfb5.PNG" width ="250">

<img src ="https://user-images.githubusercontent.com/69136340/129530637-c95e7a80-4adb-4dfa-b6dd-9874b8bfd760.PNG" width ="250">


์ฒ์์ ์๋ํ๋ฉด ์ด๋ฐ ํ๋ฉด์ด ๋์ฌํ๋ฐ Kakao developers ์ [๋ด ์ดํ๋ฆฌ์ผ์ด์] > [์ ํ์ค์ ] > [์นด์นด์ค ๋ก๊ทธ์ธ] ์์ ์นด์นด์ค ๋ก๊ทธ์ธ์ ํ์ฑํ๋ฅผ ํด์ฃผ์ด์ผ๋ง ์ค์  ์๋น์ค์์ ์ฌ์ฉํ  ์ ์๋ค.

<img width="800" alt="10" src="https://user-images.githubusercontent.com/69136340/129530654-02fd92ba-c644-423f-bb52-11a1700f8779.png">

์ด์ ๊ฐ์ด ํ์ฑํ๋ฅผ ํด์ฃผ๋ฉด ๋ค์๊ณผ ๊ฐ์ด ๋ก๊ทธ์ธ ํ๋ฉด์ด ๋ณด์ฌ์ง๋ค.

<img src ="https://user-images.githubusercontent.com/69136340/129530746-03c228ff-c7f6-44ed-8334-180d7bda7bba.jpeg" width ="250">

## ๐  ์นด์นด์ค๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ

### 1๏ธโฃ ๊ธฐ๋ฅ๊ตฌํ

```swift
// โ ๋ชจ๋ ์ถ๊ฐ
import KakaoSDKUser

// ...

// โ ์นด์นด์ค๋ก๊ทธ์ธ ์ด๋ฏธ์ง์ UITapGestureRecognizer ๋ฅผ ๋ฑ๋กํ  ๋ ์ฌ์ฉํ  @objc ๋ฉ์๋.
// โ ์นด์นด์ค๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ
    @objc
    func loginKakaoAccount() {
        print("loginKakaoAccount() called.")
        
        // โ ๊ธฐ๋ณธ ์น ๋ธ๋ผ์ฐ์ ๋ฅผ ์ฌ์ฉํ์ฌ ๋ก๊ทธ์ธ ์งํ.
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                // โ ํ์๊ฐ์ ์ฑ๊ณต ์ oauthToken ์ ์ฅ
                // _ = oauthToken
                
                // โ ์ฌ์ฉ์์ ๋ณด๋ฅผ ์ฑ๊ณต์ ์ผ๋ก ๊ฐ์ ธ์ค๋ฉด ํ๋ฉด์ ํ ํ๋ค.
                self.getUserInfo()
            }
        }
    }
```

์นด์นด์ค๊ณ์ ์ผ๋ก ๋ก๊ทธ์ธ๋ ์๋๋์ง ํ์ธํด๋ณด๊ฒ ๋ค.

<img src ="https://user-images.githubusercontent.com/69136340/129530798-e64745bb-3fb4-403f-94ab-b2aa3428ac41.jpeg" width ="250">

## ๐  ๋์ ํญ๋ชฉ ์ค์ 

์ฒ์์๋ ๋์ํญ๋ชฉ์ด ํ๋๋ ์ค์ ๋์ด ์์ง ์์ ๊ฒ์ ํ์ธํ  ์ ์๋ค. ์ด๊ฒ์ Kakao Developer ์์ ์ค์ ๊ฐ๋ฅํ๋ค.

<img width="800" alt="แแณแแณแแตแซแแฃแบ 2021-08-16 แแฉแแฎ 3 09 40" src="https://user-images.githubusercontent.com/69136340/129530846-00ddd4de-6414-46a7-a4e3-670a9f1e0d77.png">

์ด๋ฉ์ผ ๊ฒฝ์ฐ๋ ํ์๋์๋ฅผ ๋ฐ๊ธฐ์ํด์๋ ๊ฒ์๋ฅผ ํ์ํ๋ค. ๊ทธ๋์ ๋๋ค์์ ํ์๋์, ์ด๋ฉ์ผ์ ์ ํ๋์๋ก ๋์๋ฅผ ๋ฐ์๋ณด๊ฒ ๋ค.

<img src ="https://user-images.githubusercontent.com/69136340/129530853-51cef447-4e27-4c8b-961b-e2e88e8d3f84.PNG" width ="250">

## ๐ ๋ก๊ทธ์์ & ์ฐ๊ฒฐ ๋๊ธฐ

- ๋ก๊ทธ์์ : ๋ก๊ทธ์์ API๋ ํ ํฐ์ ์ญ์ ํ์ฌ, ๋ ์ด์ ํด๋น ์ฌ์ฉ์ ์ ๋ณด๋ก ์นด์นด์ค API๋ฅผ ํธ์ถํ  ์ ์๋๋ก ํฉ๋๋ค.
- ์ฐ๊ฒฐ๋๊ธฐ : ์ฐ๊ฒฐ ๋๊ธฐ API๋ ์นด์นด์ค ํ๋ซํผ ์์์ ์ฑ๊ณผ ์ฌ์ฉ์ ์นด์นด์ค๊ณ์ ์ ์ฐ๊ฒฐ ์ํ๋ฅผ ํด์ ํฉ๋๋ค.

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
        
        // โ ๋ก๊ทธ์์ : ๋ก๊ทธ์์์ API ์์ฒญ์ ์ฑ๊ณต ์ฌ๋ถ์ ๊ด๊ณ์์ด ํ ํฐ์ ์ญ์  ์ฒ๋ฆฌํ๋ค๋ ์ ์ ์ ์ํฉ๋๋ค.
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                
                // โ ๋ก๊ทธ์์ ์ ๋ฉ์ธ์ผ๋ก ๋ณด๋
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    @IBAction func unlinkClicked(_ sender: Any) {
        
        // โ ์ฐ๊ฒฐ ๋๊ธฐ : ์ฐ๊ฒฐ์ด ๋์ด์ง๋ฉด ๊ธฐ์กด์ ํ ํฐ์ ๋ ์ด์ ์ฌ์ฉํ  ์ ์์ผ๋ฏ๋ก, ์ฐ๊ฒฐ ๋๊ธฐ API ์์ฒญ ์ฑ๊ณต ์ ๋ก๊ทธ์์ ์ฒ๋ฆฌ๊ฐ ํจ๊ป ์ด๋ค์ ธ ํ ํฐ์ด ์ญ์ ๋ฉ๋๋ค.
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
                
                // โ ์ฐ๊ฒฐ๋๊ธฐ ์ ๋ฉ์ธ์ผ๋ก ๋ณด๋
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension LogoutViewController {
    // ...
}
```

## ๐ ์ฌ์ฉ์ ์ ๋ณด ๊ฐ์ ธ์ค๊ธฐ

๋๋ค์(`user.kakaoAccount.profile.nickname`)๊ณผ ์ด๋ฉ์ผ(`user.kakaoAccount.email`)์ ๊ฐ์ ธ์ ๋ณด๋๋ก ํ๊ฒ ๋ค.

```swift
extension LoginViewController {

// โ ์ฌ์ฉ์ ์ ๋ณด๋ฅผ ์ฑ๊ณต์ ์ผ๋ก ๊ฐ์ ธ์ค๋ฉด ํ๋ฉด์ ํ ํ๋ค.
    private func getUserInfo() {

        // โ ์ฌ์ฉ์ ์ ๋ณด ๊ฐ์ ธ์ค๊ธฐ
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                // โ ๋๋ค์, ์ด๋ฉ์ผ ์ ๋ณด
                let nickname = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                
                // โ ์ฌ์ฉ์ ์ ๋ณด ๋๊ธฐ๊ธฐ
                nextVC.nickname = nickname
                nextVC.email = email

                // โ ํ๋ฉด์ ํ
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
```

๊ฐ ํญ๋ชฉ์ ์๋ฃํ ๋ฑ์ ์๋๋ฅผ ์ฐธ๊ณ ํด์ ๊ฐ์ ธ์ฌ ์ ์๋ค.

[Kakao Developers](https://developers.kakao.com/sdk/reference/ios/release/KakaoSDKUser/Structs/User.html)

## ๐ ํ ํฐ ์กด์ฌ ์ฌ๋ถ ํ์ธํ๊ธฐ

ํ ํฐ์ ์กด์ฌ ์ฌ๋ถ๋ฅผ ํ์ธํด์ ์ฑ ์คํ ์ ํ์๊ฐ์์ ์ํฌ์ง ๋ฉ์ธํ๋ฉด์ผ๋ก ๋ณด๋ผ์ง ๋ถ๊ธฐ์ฒ๋ฆฌํ  ์ ์๋ค.

- ๋ทฐ๊ฐ ๋ค ๋ณด์ฌ์ง ํ ํ ํฐ์ ๊ฒ์ฌํด์ ์ ํจ์ฑ์ด ํ์ธ๋๋ฉด ๋ก๊ทธ์ธ๋ ํ๋ฉด์ผ๋ก ์ ํํด์ฃผ์๋ค. (AppDelegate.swift ์์ ์ฑ ์คํ ์ ์ฒซ ํ๋ฉด์ ๋ถ๊ธฐ์ฒ๋ฆฌ๋ฅผ ์ํด์ ์ฌ์ฉํด์ฃผ์ด๋ ๋๋ค.)

```swift
import UIKit
// โ ๋ชจ๋ ์ถ๊ฐ
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class LoginViewController: UIViewController {

// ...

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // โ ์ ํจํ ํ ํฐ ๊ฒ์ฌ
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //๋ก๊ทธ์ธ ํ์
                    }
                    else {
                        //๊ธฐํ ์๋ฌ
                    }
                }
                else {
                    //ํ ํฐ ์ ํจ์ฑ ์ฒดํฌ ์ฑ๊ณต(ํ์ ์ ํ ํฐ ๊ฐฑ์ ๋จ)
                    // โ ์ฌ์ฉ์ ์ ๋ณด๋ฅผ ๊ฐ์ ธ์ค๊ณ  ํ๋ฉด์ ํ์ ํ๋ ์ปค์คํ ๋ฉ์๋
                    self.getUserInfo()
                }
            }
        }
        else {
            //๋ก๊ทธ์ธ ํ์
        }
    }
}
```

์ถ์ฒ : 

[Kakao Developers kakaologin/ios](https://developers.kakao.com/docs/latest/ko/kakaologin/ios)
