class AddTitleToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :title, :string
  end
end
