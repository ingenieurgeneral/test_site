class RenameCardrelationshipTable < ActiveRecord::Migration
	def up
		rename_table :cardrelationships, :lessonrelationships
		rename_column :lessonrelationships, :card_id, :lesson_id
	end
	def down
		rename_table :lessonrelationships, :cardrelationships
		rename_column :lessonrelationships, :lesson_id, :card_id
	end
end
