# frozen_string_literal: true

class GroupQuery
  class << self
    def call
      sql = "INNER JOIN (#{min_date_sql}) as picked ON start_date = min AND groups.course_id = picked.course_id"
      Group.joins(sql).to_sql
    end

    private

    def min_date_sql
      Group.coming.select('course_id, MIN(start_date)').group(:course_id).to_sql
    end
  end
end
