class AddColumnHoraFoto < ActiveRecord::Migration
  def up
    add_column :fotos, :hora, :string
  end

  def down
  	remove_column :fotos, :hora
  end
end
