class Category
  include Mongoid::Document

  validates :name , :order , presence: true

  field :name, type: String
  field :order, type: Integer
  field :status, type: Mongoid::Boolean , default: true

  index( { order: 1 } , { unique: true } )

  has_many :post


end
