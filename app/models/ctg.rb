class Ctg < ApplicationRecord
   has_many :tchings, dependent: :destroy
   validates :ctg, presence: true, length: { maximum: 50 }
end


