class Label < ApplicationRecord
  belongs_to :color
  has_many :activities, dependent: :nullify

  validates_presence_of :description
end
