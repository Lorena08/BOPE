class Color < ApplicationRecord
  has_one :label, dependent: :nullify
  has_one :status, dependent: :nullify

end
