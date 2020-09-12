# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParticipationsController, type: :controller do
  describe 'POST create' do
    let(:send_request) { post :create, params: params, format: :json }
    let(:params) { { participation: participation_params } }

    describe 'with valid params' do
      context 'with new student' do
        let(:participation_params) { { group_id: Group.take.id, email: FFaker::Internet.email } }

        it 'expect success' do
          send_request
          expect(response).to have_http_status(:success)
        end
      end

      context 'with existing student' do
        let(:participation_params) { { group_id: Group.take.id, email: 'nothing@test.com' } }

        it 'expect success' do
          send_request
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'with invalid params' do
      context 'with already registred student' do
        let(:participation_params) { { group_id: Group.take.id, email: 'all@test.com' } }

        it 'expect success' do
          send_request
          expect(response).to have_http_status(:unprocessable_entity)
          parsed_response = JSON.parse(response.body)
          expect(parsed_response.fetch('group_id')).to be_present
        end
      end

      context 'with wrong email student' do
        let(:participation_params) { { group_id: Group.take.id, email: 'test' } }

        it 'expect success' do
          send_request
          expect(response).to have_http_status(:unprocessable_entity)
          parsed_response = JSON.parse(response.body)
          expect(parsed_response.fetch('email')).to be_present
        end
      end
    end
  end
end
