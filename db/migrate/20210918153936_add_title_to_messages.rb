class AddTitleToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :title, :string
  end
end
