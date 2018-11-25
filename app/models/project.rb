class Project
  include Mongoid::Document
  include ActiveModel::Validations
  has_many :cards, dependent: :destroy
  field :name, type: String
  field :state, type: Integer

  validates :name, length: { minimum: 3 }
end
