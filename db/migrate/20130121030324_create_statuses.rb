class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :site_id
      t.string :status
      t.string :response_code

      t.timestamps
    end
  end
end
