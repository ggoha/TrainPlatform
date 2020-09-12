# frozen_string_literal: true

class ParticipationsController < ApplicationController
  def create
    @participation = Registration.call(participations_params)
    respond_to do |format|
      if @participation.id
        format.js { redirect_to course_path(@participation.group.course_id), notice: I18n.t('.registration.success') }
        format.json { render json: @participation, status: :created }
      else
        format.js { render 'participations/fail' }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def participations_params
    params.require(:participation).permit(:group_id, :email)
  end
end
