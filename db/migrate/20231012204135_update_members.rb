class UpdateMembers < ActiveRecord::Migration[6.1] # Adjust the version [6.1] as per your Rails version
  def change
    # Add full_name and email columns
    add_column :members, :full_name, :string
    add_column :members, :email, :string


    # Remove first_name and last_name columns
    remove_column :members, :nameFirst
    remove_column :members, :nameLast
  end
end
