class Flag < ApplicationRecord
  belongs_to :story
  has_many :plot_flags, dependent: :destroy
  has_many :plots, through: :plot_flags

  validates :title, presence: true, length: { maximum: 100 }
  validates :check_created, inclusion: { in: [ true, false ] }
  validates :check_recovered, inclusion: { in: [ true, false ] }
end
