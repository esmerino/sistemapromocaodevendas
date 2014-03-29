class AddColumn < ActiveRecord::Migration
  def up
  	add_column :visita, :data_hora_inicio, :timestamp
  	add_column :visita, :data_hora_fim, :timestamp
  end

  def down
  end
end
