class AddDocumentToPaymentsCredits < ActiveRecord::Migration
  def change
    add_column :payments_credits, :document, :string
  end
end
