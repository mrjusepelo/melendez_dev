class MoverindiceSales < ActiveRecord::Migration
  def change
	remove_index(:sales, :name => 'index_sales_on_admin_creator_id')
  end
end
