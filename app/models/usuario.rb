class Usuario < ActiveRecord::Base
    has_one :climatizador
    has_one :umidificador
end
