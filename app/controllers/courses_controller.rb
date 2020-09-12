# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @results = ActiveRecord::Base.connection.raw_connection.exec(CourseQuery.call)
  end

  def show
    @course = Course.find(params[:id])
    @groups = Group.coming.where(course_id: @course.id).includes(:students).ordered
    @participation = Participation.new
  end
end
