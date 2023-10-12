class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
