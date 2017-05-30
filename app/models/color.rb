class Color < ApplicationRecord
  has_one :label, dependent: :nullify
  has_one :status, dependent: :nullify

  validates_presence_of :description

end
