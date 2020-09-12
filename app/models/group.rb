# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :course
  has_many :participations
  has_many :students, through: :participations

  scope :coming, -> { where('groups.start_date > ?', Time.now) }
  scope :ordered, -> { order('start_date') }
end
