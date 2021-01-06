# アプリケーション名

trip diary

# アプリケーション概要

旅の計画を立てて共有することのできるアプリ。
旅行の概要や日程・行程を登録し、「旅のしおり」を作成するような感覚で使用できます。
金額や参考リンクなど、旅先で役立つ情報を自由にメモしたり、友達を追加して共同編集したりすることができます。

# URL

https://trip-diary-18.herokuapp.com/

# テスト用アカウント

メールアドレス：test@sample.com
パスワード：test1234

# 利用方法

1. ヘッダー「新規登録」ボタンからユーザー情報を登録
2. ヘッダー「旅の作成」ボタンから計画したい旅行の情報を入力
3. 旅程を作成したい日次を入力
4. その日の「スケジュール追加」ボタンからその日に訪れたいスポットの情報を入力
5. 編集を完了したい場合は「完了」ボタンをクリック
6. 再び編集したい場合は「編集モード」をクリックして編集モードへ移行
7. 編集したい旅行・スポットの編集アイコンをクリック
8. スポットはドラッグアンドドロップで並び替えできる
9. 旅行・スポットを削除したい場合はゴミ箱アイコンをクリック

# 目指した課題解決

グループで旅行に行く際、メンバーと旅程を共有できるツールが少ないという課題がありました。
私自身、旅の計画を立てる機会が多いのですが、常にその課題に悩まされていました。
その改題を解決するため、気軽で自由に旅程を作成でき、複数人で共同編集できるアプリを作成しました。
若い世代へ訴求するため、おしゃれで使い勝手の良いデザインとなることを意識しました。

# 洗い出した要件

- ユーザー登録・編集機能
- プロフィール画像登録機能
- 旅程作成・編集・削除機能
- 旅行の一覧表示機能
- 旅行の詳細表示機能
- 旅行の画像登録機能
- 旅行への友達追加機能
- 日程の並び替え機能
- レスポンシブデザイン
- 入力フォームのモーダル表示
- 外部サイトの情報取得・表示

# 実装した機能の特徴

## 旅行への友達追加機能

中間テーブルを設けて多対多のアソシエーションを組むことで、旅行にユーザーを複数人追加する機能を実装しました。
追加されたユーザーはその旅行を編集できるようになります。

## 日程の並び替え機能

Sortable.jsというライブラリを使用し、ドラッグアンドドロップすることで1つひとつの予定を非同期で並び替えることのできる機能を実装しました。
後から順番を入れ替えられることで旅の計画をする際の自由度が上がります。

## 入力フォームのモーダル表示

Bootstrapを導入して旅程の作成・編集画面をモーダル表示としました。
非同期通信とすることでユーザビリティの向上を図りました。

## 外部サイトの情報取得・表示

REST APIを使用して、外部サイトの投稿を取得し本アプリのindexページに表示する機能を実装しました。
現在はWordPressで作成したブログの記事を「おすすめスポット」として表示しています。

# 実装予定の機能

- ブックマーク機能
- コメント機能
- 公開・非公開の設定
- 交通・食事・宿泊予約との連携
- 施設情報の取得
- 旅程の位置情報プロット
- 乗り換え・ルート案内との連携


# テーブル設計

## ER図

![](https://18kipper.com/wp-content/uploads/2021/01/trip-diary1.png)

## users テーブル

| Column             | Type    | Options                                       |
| ------------------ | ------- | --------------------------------------------- |
| name               | string  | null: false                                   |
| email              | string  | null: false, unique: true, confirmation: true |
| encrypted_password | string  | null: false, length: { minimum: 6 }           |

### Association

- has_many :trips, through: trip_users

## trips テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| title        | string     | null: false                    |
| start_date   | date       |                                |
| end_date     | date       |                                |
| memo         | text       |                                |

### Association

- has_many   :user, through: trip_users
- has_many   :plans
- has_many   :spots

## trip_users テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| user         | references | null: false, foreign_key: true |
| trip         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :trip

## plans テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| daily         | integer    |                                |
| trip          | references | null: false, foreign_key: true |

### Association

- belongs_to :trip
- has_many   :spots

## spots テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| category_id   | integer    | null: false                    |
| start_time    | time       |                                |
| end_time      | time       |                                |
| fee           | integer    |                                |
| link          | string     |                                |
| memo          | text       |                                |
| plan          | references | null: false, foreign_key: true |

### Association

- belongs_to :trip
- belongs_to :plan
