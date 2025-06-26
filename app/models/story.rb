class Story < ApplicationRecord
  attribute :status, :integer, default: 0
  belongs_to :user
  has_many :plots, dependent: :destroy

  enum status: { draft: 0, published: 1 }

  enum genre: {
    fantasy: "ファンタジー",
    sf: "SF",
    romance: "恋愛",
    mystery: "ミステリー",
    horror: "ホラー",
    history: "歴史",
    contemporary: "現代小説",
    other: "その他"
  }

  # タイトルは必須。100文字までね
  validates :title, presence: true, length: { maximum: 100 }
  # ジャンルは必須。
  validates :genre, presence: true
  # テーマはなくてもいいけど。50文字まで
  validates :thema, length: { maximum: 50 }
  # あらすじはなくてもいいけど500文字まで
  validates :synopsis, length: { maximum: 500 }
end
