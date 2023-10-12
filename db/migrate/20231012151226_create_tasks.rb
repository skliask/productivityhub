class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed, default: false, null: false
      t.datetime :due_date
      t.string :description
      t.string :text
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
