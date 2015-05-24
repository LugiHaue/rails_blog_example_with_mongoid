class Contact
  include Mongoid::Document
  include Mongoid::Timestamps
  validates :name , :email , :subject , :message , presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  field :name, type: String
  field :email, type: String
  field :subject, type: String
  field :message, type: String
  field :status, type: Mongoid::Boolean , default: false
end
