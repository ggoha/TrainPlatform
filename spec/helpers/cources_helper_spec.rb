# frozen_string_literal: true
require 'rails_helper'

describe CoursesHelper, type: :helper do
  describe '#dummy' do
    let(:value) { FFaker::Lorem.word }

    it "for nil return dummy" do
      expect(helper.dummy(nil)).to eq('-')
    end

    it "for value return value" do
      expect(helper.dummy(value)).to eq(value)
    end
  end

  describe '#dummy_date' do
    let(:value) { FFaker::Time.datetime }

    it "for nil return dummy" do
      expect(helper.dummy_date(nil)).to eq(I18n.t('soon'))
    end

    it "for value return value" do
      expect(helper.dummy_date(value)).to eq(I18n.l(value))
    end
  end
end
