class Galery < ApplicationRecord
    has_many_attached :images

    has_many :taggings , dependent: :destroy
    has_many :tags, through: :taggings , dependent: :destroy


    belongs_to :user

    # ransack_alias :author, :all_tag 

    def all_tag=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
      end
      
      def all_tag
        self.tags.map(&:name).join(", ")
      end


    def thumbnail input
        return self.images[input].variant(resize: "200x200").processed
    end
end

