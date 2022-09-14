class Comment < ApplicationRecord

  has_many :comments, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment"
  belongs_to :post
end
