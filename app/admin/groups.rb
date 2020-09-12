# frozen_string_literal: true

ActiveAdmin.register Group do
  permit_params :course_id, :start_date
end
