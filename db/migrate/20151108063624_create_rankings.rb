class CreateRankings < ActiveRecord::Migration
  # TODO: indexを付ける
  def change
    create_table :rankings do |t|
      t.references :article, index: true, foreign_key: true
      t.string :category
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
