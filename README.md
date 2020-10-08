# README

## アプリケーション名
minutes.
ー議事録アプリケーションー

## アプリケーション概要
会議等での文字のやり取りをまとめ、会議中に双方向で文字や画像の確認ができる
アプリケーション。  
議事録をアプリケーションとして、共用の場に残すことで、未来に向けて行うことの整理、振り返りを可能にする。

## URL
https://minites-app.herokuapp.com/

## テスト用アカウント
ID: name1  
PASS: 1111aaaa  

## 利用方法
トップページのヘッダーにある、新規議事録ボタンを押し、議事録を作成。  
項目を入力すると、議事録が作成できる。  
トップページより、作成した議事録に入り、記入したい議事を記載していく。  

## 目指した課題解決
社内会議において  
・参加者が共通して利用できる場の提供により、共通認識を持つことができる。  
・全員の発言を視覚化することにより、権力者の主観による決定の回避。  
・会議時間の管理を行うことができる。

## 要件定義

|実装機能    |目的|詳細|
|:---|:---|:---|
ユーザー管理機能|ユーザー登録者のみアプリを使用可能にする。|ユーザー登録後に新規議事録を作成できる。|
レスポンシブデザイン|どこにいてもどの媒体でもアプリを使いやすくする。|Bootstrapを用いたレスポンシブデザイン。|
リアルタイム相互通信機能|zoom会議等で会議の参加者が別場所にいる際、逐一議事内容を確認できるようにする。|ActionCarbleによるWebSocket通信。ユーザーがコメントを投稿した場合、他のユーザーでもリアルタイムに画面表示が切り替わる。|
リッチテキスト導入|強調したい箇所を議事録のオーナーが変更できることで、会議の主題を明確にする。|ActionTextによるリッチテキスト導入。|

## 実装した機能についてのGIFと説明

###リアルタイム相互通信機能
![Image from Gyazo](https://i.gyazo.com/929be8315ba3a52ddd26b9d2da3fa2b0.gif)](https://gyazo.com/929be8315ba3a52ddd26b9d2da3fa2b0)
railsのActionCableのgemを使用。 Websoket通信。
Ajax通信とは異なり、クライアント側とサーバー側が相互にリクエスト、レスポンスを行っている為、複数のユーザーが別の画面で、非同期で画面が更新される。  


## 実装予定の機能
・リアルタイムで同時編集機能の実装。(Operational Transformationのアルゴリズムを使用検討)  
・事前確認資料の「チェック」機能の実装。オーナーが、誰が事前に確認したか確認することができる。  
・TODOリスト作成、期日前に、メールにてリマインドを行う。  
・議事録検索機能。


## データベース設計

### users テーブル

| Column                | Type   | Options     |
| --------------------  | ------ | ----------- |
| user_name             | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| company_name          | string | null: false |

#### Association
has_many :meeting_users  
has_many :meetings, thorough: meeting_users  
had_many :contents

 
### meetings テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| title   | string  | null: false |
| check   | boolean | null: false |

#### Association
has_many :meeting_users  
has_many :users, thorough: meeting_users  
had_many :contents


### meeting_users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| meeting   | references | null: false, foreign_key: true |

#### Association
belongs_to :user  
belongs_to :meeting  


### contents テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| writing     | string     |                                |
| task        | string     |                                |
| closing_day | string     |                                |
| user        | references | null: false, foreign_key: true |
| meeting     | references | null: false, foreign_key: true |



#### Association
belongs_to :user  
belongs_to :meeting  

## ローカルでの動作方法
・Ruby 2.6.5  
・Ruby on Rails 6.0  
・MYSQL  
