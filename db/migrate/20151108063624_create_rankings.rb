class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :article, index: true, foreign_key: true
      t.string :category
      t.integer :ranking

      t.timestamps null: false
    end

    add_index :rankings, :created_at
    add_index :rankings, :category
  end
end
