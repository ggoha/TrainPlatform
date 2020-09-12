# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupQuery, type: :query do
  let(:result) { ActiveRecord::Base.connection.raw_connection.exec(described_class.call) }
  describe '#call' do
    describe 'with course without group' do
      let(:inactive_course) { Course.ids - Group.pluck(:course_id).uniq }

      it 'not return record' do
        expect(result.map { |i| i['course_id'] }).not_to include(inactive_course)
      end
    end

    describe 'with course without group in the future' do
      let(:inactive_course) { Course.ids - Group.where('groups.start_date < ?', Time.now).pluck(:course_id).uniq }

      it 'not return record' do
        expect(result.map { |i| i['course_id'] }).not_to include(inactive_course)
      end
    end

    describe 'for acive course' do
      let(:nearest_group) { Course.all.map { |course| course.groups.coming.ordered.limit(1)&.ids }.flatten.compact }

      it 'return nearest group' do
        expect(result.map { |i| i['id'] }).to eq(nearest_group)
      end
    end
  end
end
