# README

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