class SetDefaultForPostContent < ActiveRecord::Migration
  def change
    change_column :posts, :content, :text, default: ''
  end
end
