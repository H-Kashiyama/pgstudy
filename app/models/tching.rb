class Tching < ApplicationRecord
  belongs_to :ctg
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :ctg, presence: true
end