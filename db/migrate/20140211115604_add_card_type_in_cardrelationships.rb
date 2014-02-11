class AddCardTypeInCardrelationships < ActiveRecord::Migration
  def change
    add_column :cardrelationships, :card_type, :string
  end
end
