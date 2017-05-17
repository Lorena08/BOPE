class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  has_many :projects # adicionado

  #has_and_belongs_to_many :users
  validates_presence_of :description
end
