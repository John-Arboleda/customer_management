class RemoveClientIdFromClients < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :client_id, :integer
  end
end
