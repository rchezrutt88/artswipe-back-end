class AddHeightToArts < ActiveRecord::Migration
  def change
    add_column :arts, :height, :integer
  end
end
