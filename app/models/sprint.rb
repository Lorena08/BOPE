class Sprint < ApplicationRecord
<<<<<<< HEAD

  # Associations
  has_many :project_sprints, dependent: :destroy
  has_many :projects, through: :project_sprints
  has_many :activities, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :weeks, dependent: :destroy

  # Validations
  validates_presence_of :description, :semester, :inicio, :fim
  validate :inicio_is_date?

  private

  def inicio_is_date?
    if !inicio.is_a?(Date)
      errors.add(:inicio, 'não é uma data válida')
    end
  end
=======
  validates_presence_of :description, :inicio, :fim, :pontos_cadastrados

  validate :inicio_is_date?

    private

    def inicio_is_date?
      if !inicio.is_a?(Date)
        errors.add(:inicio, 'não é uma data válida')
      end
    end
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
end
