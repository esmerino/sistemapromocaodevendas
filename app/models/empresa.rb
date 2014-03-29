class Empresa < ActiveRecord::Base
  attr_accessible :nome_fantasia

  has_many :visitum

  before_save :uppercase_icao
  def uppercase_icao
    self.nome_fantasia.upcase!
  end
end
