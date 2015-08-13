class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
    	t.string :address
    	t.string :call_type
    	t.datetime :call_time
    	t.string :location
      t.timestamps null: false
    end
  end
end
