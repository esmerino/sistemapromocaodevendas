class DropTableDates < ActiveRecord::Migration
  def up
  	remove_column :visita, :data_hora_inicio
  	remove_column :visita, :data_hora_fim
  end

  def down
  end
end
