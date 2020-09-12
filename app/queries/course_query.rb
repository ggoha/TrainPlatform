# frozen_string_literal: true

class CourseQuery
  def self.call
    Course.joins("LEFT JOIN (#{GroupQuery.call}) as picked ON courses.id = picked.course_id")
          .order(:start_date).select(%w[courses.title courses.id start_date students_count]).to_sql
  end
end
