# frozen_string_literal: true

class CreateAbilities < ActiveRecord::Migration[4.2]
  def change
    create_table :abilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
