class Item < ApplicationRecord
    has_one_attached :albumart
    has_many :comments, dependent: :destroy
end
