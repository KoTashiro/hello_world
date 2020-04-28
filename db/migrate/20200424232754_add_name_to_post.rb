class AddNameToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :child_name, :string
    add_column :posts, :ruby_name, :string
    add_column :posts, :need_ruby, :boolean
    add_column :posts, :need_space, :boolean
    add_column :posts, :thread_color, :string
    add_column :posts, :font_name, :string
  end
end
