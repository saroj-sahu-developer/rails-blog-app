class AddAgeToDemos < ActiveRecord::Migration[7.1]
  def change
    add_column :demos, :age, :integer
    add_column :demos, :mark, :integer
  end
end
