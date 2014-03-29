class Visitum < ActiveRecord::Base
  attr_accessible :data_hora_fim, :data_hora_inicio, :empresa_id, :latitude, :longitude,:funcionario_id
  validates_presence_of :data_hora_fim, :data_hora_inicio, :empresa, :latitude, :longitude,:funcionario_id, :message =>"false"
  belongs_to :funcionario
  belongs_to :empresa
  has_many :fotos
end
