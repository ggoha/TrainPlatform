# frozen_string_literal: true

class Participation < ApplicationRecord
  belongs_to :student
  belongs_to :group,  counter_cache: :students_count

  validates :group_id, uniqueness: { scope: :student_id }
  validates :student_id, presence: true
  validates :group_id, presence: true
end
