require 'table_migration_helper'

class CreateTopicStatusUpdatesAgain < ActiveRecord::Migration
  def up
    create_table :topic_status_updates do |t|
      t.datetime :execute_at, null: false
      t.integer :status_type, null: false
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.boolean :based_on_last_post, null: false, default: false
      t.datetime :deleted_at
      t.integer :deleted_by_id
      t.timestamps
      t.integer :category_id
    end

    TableMigrationHelper.read_only_table('topic_status_updates')
  end

  def down
    drop_table :topic_status_updates
  end
end