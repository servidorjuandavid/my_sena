module ActiveRecord

  
  class Base

    #{atributos nombre, correo, fecha naciemiento, programa}atributos dinamicos
    def initialize(params = {})
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
        self.class.send(:define_method, key) do
          instance_variable_get("@#{key}")
        end
      end
    end

    def save
      
    end

    def self.all   

    end
    
    
    def self.table_name
      raise("NotImplementedError")
    end

  end
end

  
    

