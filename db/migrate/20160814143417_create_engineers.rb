# frozen_string_literal: true

class CreateEngineers < ActiveRecord::Migration[4.2]
  def change
    create_table :engineers do |t|
      t.string :name

      t.string :career
      t.integer :marketing
      t.integer :consulting
      t.integer :architect
      t.integer :management
      t.integer :specialist
      t.integer :development

      t.timestamps null: false
    end
  end
end
