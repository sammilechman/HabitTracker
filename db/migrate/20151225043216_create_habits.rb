class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
