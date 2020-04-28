class RemoveTitleFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :description, :string
  end
end
