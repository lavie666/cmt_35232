## アプリケーション名  
## CMT(Clients Management Tool)
----------
### アプリケーションの概要  
* 自身の顧客を簡単に管理するためのツール。  
新規登録をしてユーザーログインを行い、顧客追加ボタンから情報を入力して管理する  
マイページから自分が追加した顧客をすぐに確認できると同時に、検索により特定の顧客をすぐに呼び出すことも可能  
他のユーザーが追加した顧客は名前と画像のみをトップページ上で見ることができ、詳細情報は追加した本人しか見ることができないようになっている。

### 本番環境  
* https://cmt-35232.herokuapp.com/  
* Basic認証  
ユーザーID:hamada  
パスワード:1234  
* テストアカウント  
email:hamada@com  
パスワード:111111  

### このアプリケーションを作った理由  
* 前職の経験から、仕事で個人的な顧客を持つ人ができる限り簡単に顧客管理ができるようなアプリケーションがあると便利かと思い、情報入力がそれほどめんどくさくならないようなものを目指しました

### 実装した機能についての画像やGIFおよびその説明  
* ユーザー管理機能  
トップページより新規登録ボタンを押す。名前、メールアドレス、パスワードを入力し、新規登録を行う。  
トップページ上部のログアウトボタンでログアウト可能。ログアウト時はログアウトボタンがあったところにログインボタンが現れるのでそこからログインをする  

* 顧客追加機能  
ログインしている状態でしか顧客追加できない。トップページ上部にある自分のユーザー名をクリックすることで顧客追加ボタンが現れ、そこから情報入力画面へ遷移。  
情報入力画面では名前と名前の読み方は必須となっており、それ以外は任意で入力できる。追加ボタンを押して登録完了。  
トップページまたはマイページの顧客名をクリックすることで顧客の詳細ページへ遷移する。詳細ページにて編集と削除が可能  

* 予定追加機能  
顧客詳細ページにある予定追加ボタンから予定追加ページへ遷移する。  
そこで日付を指定し、予定を書き込み追加ボタンを押すことで詳細ページに予定が組み込まれるようになる。予定の横に削除ボタンを起き、予定ごとに削除することができる。

### 工夫したポイント  
* 顧客情報を入力する上で必要そうな情報をピックアップしてなるべく見やすく入力しやすくしたところ  
* client controllerとcalendar controllerをネストし、それぞれのテーブルで保存できるようにしたところ  
* 予定入力機能を実装したところ  

### 開発環境  
* HTML,CSS,Ruby

### 追加予定機能  
* 誕生日のところに年齢表示されるようにする、名前と名前かなの部分に必須と入れる

## データベース設計
----------

### usersテーブル

| Column              | Type   | Options                  |
| ----------          | ------ | ---------                | 
| name                | string | null: false              |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false              |     


### Association
- has_many :clients
- has_many :calendars
----------
### clientsテーブル

| Column             | Type        | Options           |
| ----------         | ----------- | ---------         |
| name               | string      | null: false       |
| name_hiragana      | string      | null: false       |
| birthday           | date        |                   |
| prefecture_id      | integer     |                   |
| from_id            | integer     |                   |
| corporation        | string      |                   |
| drink              | string      |                   |
| food               | string      |                   |
| cigarettes         | string      |                   |
| memo               | text        |                   |
| user               | references  | foreign_key: true |

### Association
- belongs_to :user
- has_many   :calendars
----------
### calendarsテーブル

| Column              | Type      | Options                  |
| ----------          | ------    | ---------                | 
| plan                | string    |                          |
| date                | date      |                          |
| user                | reference | foreign_key: true        |     
| client              | reference | foreign_key: true        | 

### Association
- belong_to :client
- belong_to :user

