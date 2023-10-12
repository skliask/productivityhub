class CreateBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table :blocks do |t|
      t.string :text
      t.integer :block_type, default: 0, null: false
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
