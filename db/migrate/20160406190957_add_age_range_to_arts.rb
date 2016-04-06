class AddAgeRangeToArts < ActiveRecord::Migration
  def change
    add_column :arts, :age_range, :string
  end
end
