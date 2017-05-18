class Activity < ApplicationRecord
  belongs_to :status
  belongs_to :label
  belongs_to :sprint
  belongs_to :project
end
