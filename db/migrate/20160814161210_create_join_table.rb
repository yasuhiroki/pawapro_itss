# frozen_string_literal: true

class CreateJoinTable < ActiveRecord::Migration[4.2]
  def change
    create_join_table :engineers, :abilities do |t|
      # t.index [:engineer_id, :ability_id]
      # t.index [:ability_id, :engineer_id]
    end
  end
end
