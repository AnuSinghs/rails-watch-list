class Changenametocomment < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookmarks, :name, :comment
  end
end
