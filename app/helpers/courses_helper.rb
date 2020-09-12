# frozen_string_literal: true

module CoursesHelper
  def dummy(value)
    value || '-'
  end

  def date_dummy(value)
    value ? I18n.l(value) : I18n.t('soon')
  end
end
