# frozen_string_literal: true

module ParticipationsHelper
  def options_for_select
    @groups.pluck(:start_date, :id).map { |value| [I18n.l(value[0]), value[1]] }
  end
end
