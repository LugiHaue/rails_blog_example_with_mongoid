class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  validates :title, :category_id, :tags, :is_active, presence: true

  field :title, type: String
  field :category_id, type: String
  field :image_id, type: String
  field :tags, type: Array
  field :is_active, type: Mongoid::Boolean , default: true

  has_one :content
  belongs_to :image
  belongs_to :category
end
