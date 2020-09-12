# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :participations
  has_many :groups, through: :participations

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true
  validates :email, uniqueness: true
end
