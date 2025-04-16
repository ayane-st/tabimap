class AddRocationToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :rocation, :text
  end
end
