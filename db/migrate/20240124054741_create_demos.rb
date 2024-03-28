class CreateDemos < ActiveRecord::Migration[7.1]
  def change
    create_table :demos do |t|
      t.string :name
      t.references :Article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
