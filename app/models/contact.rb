class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :category, :string
  attribute :content, :string

  VALID_CATEGORIES = [ "ご意見・ご要望", "不具合報告", "その他" ].freeze

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :category, presence: true
  validates :content, presence: true
end
