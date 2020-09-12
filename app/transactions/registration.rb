# frozen_string_literal: true

class Registration
  def self.call(params)
    student = Student.find_or_create_by(email: params.delete(:email))
    participation = Participation.create(params.merge(student: student))

    participation.errors.add(:email, student.errors[:email]) unless student.errors[:email].empty?
    participation
  end
end
