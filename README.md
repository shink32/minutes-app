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


## 利用方法

## 目指した課題解決

## 洗い出した要件

## 実装した機能についてのGIFと説明

## 実装予定の機能

## データベース設計

## ローカルでの動作方法







This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

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

### Association
has_many :meeting_users
has_many :meetings, thorough: meeting_users
had_many :contents

 
## meetings テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| title   | string  | null: false |
| check   | boolean | null: false |

### Association
has_many :meeting_users
has_many :users, thorough: meeting_users
had_many :contents


## meeting_users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| meeting   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :meeting


## contents テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| writing     | string     |                                |
| task        | string     |                                |
| closing_day | string     |                                |
| user        | references | null: false, foreign_key: true |
| meeting     | references | null: false, foreign_key: true |



### Association
belongs_to :user
belongs_to :meeting