class PostSub < ApplicationRecord
    validates :sub_id, :post_id, presence: true, unique: true

    has_and_belongs_to_many :posts 
    has_and_belongs_to_many :subs
end