# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :groups
  has_many :students, through: :groups
end
