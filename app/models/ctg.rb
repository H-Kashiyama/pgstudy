class Ctg < ApplicationRecord
    has_many :tchings
    validates :ctg, presence: true, length: { maximum: 255 }
end
