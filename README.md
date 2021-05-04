* アプリケーション名

CMT(Clients Management Tool)

* アプリケーションの概要

自身の顧客を簡単に管理するためのツール

* URL



* テスト用アカウント



* 利用方法

顧客管理ということでまずはユーザー登録をし、自分以外に情報が漏れにくくする。

それから、新規顧客追加ページにて顧客情報を入力、追加していく

追加した顧客リストがトップページに表示されるので、その顧客名をクリックすることで詳細ページに遷移

トップページもしくは詳細ページより顧客情報の編集ページに遷移可能

編集ページ、詳細ページにカレンダー機能をつけ、日にち単位で情報を追加できる

また、顧客が増えた時のために検索機能を使っての顧客検索も可能

* 目指した課題解決

前職の経験から、仕事で個人的な顧客を持つ人ができる限り簡単に顧客管理ができるようなアプリケーションがあると便利かなと思い、情報入力がそれほどめんどくさくならないようなものを目指しました


* 洗い出した要件



* 実装した機能についての画像やGIFおよびその説明



* ローカルでの操作方法


* データベース設計

## usersテーブル

| Column              | Type   | Options                  |
| ----------          | ------ | ---------                | 
| name                | string | null: false              |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false              |     


### Association
- has_many :clients


## clientsテーブル

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


