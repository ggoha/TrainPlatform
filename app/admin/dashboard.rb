# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Recent Course' do
          ul do
            Course.last(5).map do |course|
              li link_to(course.title, admin_course_path(course))
            end
          end
        end
      end

      column do
        panel 'Recent Group' do
          ul do
            Group.last(5).map do |group|
              li link_to(group.start_date, admin_group_path(group))
            end
          end
        end
      end
    end
  end
end
