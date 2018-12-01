class Climatizador < ActiveRecord::Base
    has_one :relatorio
    belongs_to :usuario
end
