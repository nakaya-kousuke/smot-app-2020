class Store < ApplicationRecord
  belongs_to :user, optional: true
  # has_many :users, through: :favorites, optional: true
  has_many :favorites, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true


  validates :store_name,            presence: true
  validates :postal_code,           presence: true
  validates :prefectures,           presence: {massage: "選択して下さい"}
  validates :ctiy,                  presence: true
  validates :block_number,          presence: true
  validates :phone_number,          presence: true
  validates :open_time,             presence: {massage: "選択して下さい"}
  validates :close_time,            presence: {massage: "選択して下さい"}
  validates :holiday,               presence: {massage: "選択して下さい"}
  validates :smoking_environment,   presence: {massage: "選択して下さい"}
  validates :website_url,           presence: true

  enum prefectures: {
    "北海道": 1, "青森県": 2, "岩手県": 3, "宮城県": 4, "秋田県": 5,
    "山形県": 6, "福島県": 7, "茨城県": 8, "栃木県": 9, "群馬県": 10,
    "埼玉県": 11, "千葉県": 12, "東京都": 13, "神奈川県": 14, "新潟県": 15,
    "富山県": 16, "石川県": 17, "福井県": 18, "山梨県": 19, "長野県": 20,
    "岐阜県": 21, "静岡県": 22, "愛知県": 23, "三重県": 24, "滋賀県": 25,
    "京都府": 26, "大阪府": 27, "兵庫県": 28, "奈良県": 29, "和歌山県": 30,
    "鳥取県": 31, "島根県": 32, "岡山県": 33, "広島県": 34, "山口県": 35,
    "徳島県": 36, "香川県": 37, "愛媛県": 38, "高知県": 39, "福岡県": 40,
    "佐賀県": 41, "長崎県": 42, "熊本県": 43, "大分県": 44, "宮崎県": 45,
    "鹿児島県": 46, "沖縄県": 47
  }, _prefix: true

  enum open_time: {
    "0:00": 1, "1:00": 2, "2:00": 3, "3:00": 4, "4:00": 5, "5:00": 6, 
    "6:00": 7, "7:00": 8, "8:00": 9, "9:00": 10, "10:00": 11, "11:00": 12, 
    "12:00": 13, "13:00": 14, "14:00": 15, "15:00": 16, "16:00": 17, "17:00": 18, 
    "18:00": 19, "19:00": 20, "20:00": 21, "21:00": 22, "22:00": 23, "23:00": 24, "24:00": 25 
  }, _prefix: true

  enum close_time: {
    "0:00": 1, "1:00": 2, "2:00": 3, "3:00": 4, "4:00": 5, "5:00": 6, 
    "6:00": 7, "7:00": 8, "8:00": 9, "9:00": 10, "10:00": 11, "11:00": 12, 
    "12:00": 13, "13:00": 14, "14:00": 15, "15:00": 16, "16:00": 17, "17:00": 18, 
    "18:00": 19, "19:00": 20, "20:00": 21, "21:00": 22, "22:00": 23, "23:00": 24, "24:00": 25 
  }, _prefix: true

  enum holiday: {
    "月曜日": 1, "火曜日": 2, "水曜日": 3, "木曜日": 4, "金曜日": 5, "土曜日": 6, "日曜日": 7, "定休日なし": 8
  }, _prefix: true

  enum smoking_environment: {
    "喫煙可（紙巻きたばこＯＫ / 加熱式たばこＯＫ）": 1,
    "喫煙可（加熱式たばこのみＯＫ）": 2
  }, _prefix: true
end
