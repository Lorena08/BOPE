class Sprint < ApplicationRecord
  validates_presence_of :description, :inicio, :fim, :pontos_cadastrados

end
