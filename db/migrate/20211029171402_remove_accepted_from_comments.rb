class RemoveAcceptedFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :accepted, :boolean
  end
end
