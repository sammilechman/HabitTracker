class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.references :habit, index: true

      t.timestamps
    end
  end
end
