class Relatorio < ActiveRecord::Base
  belongs_to :climatizador
	belongs_to :umidificador
end
