class AddVisitaidFotos < ActiveRecord::Migration
  def up
  	add_column :fotos, :visitum_id, :integer
  end

  def down
  	remove_column :fotos, :visitum_id
  end
end
