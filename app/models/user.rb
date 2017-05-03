class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_one :user_profile, dependent: :destroy
  has_many :team_users, dependent: :destroy
  has_many :teams, through: :team_users
  #has_and_belongs_to_many :teams
  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password
  validates_format_of :email, with: EMAIL_REGEXP


  # Nested Attributes
  accepts_nested_attributes_for :user_profile, allow_destroy: true

end
