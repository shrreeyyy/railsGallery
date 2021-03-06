class Tag < ApplicationRecord

    has_many :taggings
    has_many :galeries, through: :taggings 
end
