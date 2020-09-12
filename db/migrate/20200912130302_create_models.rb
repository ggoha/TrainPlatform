# frozen_string_literal: true

class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :email, unique: true
      t.timestamps
    end

    create_table :courses do |t|
      t.string :title
      t.timestamps
    end

    create_table :groups do |t|
      t.belongs_to :course, index: true
      t.integer :students_count, nil: false, default: 0
      t.datetime :start_date
      t.timestamps
    end

    create_table :participations do |t|
      t.belongs_to :student
      t.belongs_to :group
      t.timestamps
    end

    add_index :participations, %i[student_id group_id], unique: true
  end
end
