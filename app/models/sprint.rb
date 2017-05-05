class Sprint < ApplicationRecord
  validates_presence_of :description, :inicio, :fim, :pontos_cadastrados

  validate :inicio_is_date?

    private

    def inicio_is_date?
      if !inicio.is_a?(Date)
        errors.add(:inicio, 'não é uma data válida')
      end
    end
end
