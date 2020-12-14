# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#
class Post < ApplicationRecord
    validates :title, presence: true
    validates :sub_id, uniqueness: true 
    validates :author_id, presence: true

    belongs_to :sub,
        foreign_key: :post_id,
        class_name: :Sub
    
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

end
