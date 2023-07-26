class AddTeacherCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :teacher_code, :string
  end
end
