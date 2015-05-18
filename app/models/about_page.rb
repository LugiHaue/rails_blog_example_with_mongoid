class AboutPage
  include Mongoid::Document

  validates :title , :content , presence: true

  field :title, type: String
  field :content, type: String
end
