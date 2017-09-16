class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
<<<<<<< HEAD
  has_one :project, dependent: :destroy # adicionado
=======
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700

  #has_and_belongs_to_many :users
  validates_presence_of :description
end
