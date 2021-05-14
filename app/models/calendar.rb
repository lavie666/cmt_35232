class Calendar < ApplicationRecord
  validates :plan, presence: true
  validates :date, presence: true

  belongs_to :client
  belongs_to :user
end
