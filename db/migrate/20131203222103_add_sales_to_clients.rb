class AddSalesToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :sale, index: true
  end
end
