class Tching < ApplicationRecord
  belongs_to :ctg
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :ctg_id, presence: true
end
