require 'date_validator'

class Card
  include Mongoid::Document
  belongs_to :project
  field :name, type: String
  field :details, type: String
  field :dateIn, type: Date
  field :dateOut, type: Date
  field :state, type: Integer

  validates :name, length: { minimum: 3 }
  validate :expiration_date_cannot_be_in_the_past
  validate :dates_in_order

  private
    def dates_in_order
      errors.add(:dateIn, "must be before end time") unless :dateIn < :dateOut
    end

    def expiration_date_cannot_be_in_the_past
      if dateIn.present? && dateIn < Date.today
        errors.add(:Date_in, "can't be in the past")
      end
    end
end
