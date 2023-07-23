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
## usersテーブル

| Column              | Type           | Options                                |
| ------------------- |----------------|----------------------------------------|
| email               | string         | null: false, default:Uniq ueConstraint |
| encrypted_password  | string         | not null: false                        |
| name                | string         | not null: false                        |
| profile             | text           | not null: false                        |
| occupation          | text           | not null: false                        |
| position            | text           | not null: false                        |

### Association
- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | NOT NULL                       |
| catch_copy      | text       | NOT NULL                       |
| concept         | text       | NOT NULL                       |
| user_id         | integer    | NOT NULL  , foreign_key: true  |

### Association 
- belongs_to :user
- has_many :comments

## comments テーブル

| Column          | Type       | Options                     |
| --------------- | ---------- | ------------------------    |
| content         | text       | NOT NULL                    |
| prototype_id    | reference  | NOT NULL, foreign_key: true |
| user_id         | integer    | NOT NULL, foreign_key: true |



#### Association

- belongs_to :user
- belongs_to :prototype
