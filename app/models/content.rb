class Content
  include Mongoid::Document

  validates :body , :post_id , presence: true

  field :body,  type: String
  field :post_id, type: String

  belongs_to :post

end
