class AddAvatarToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :avatar, :string
  end
end
