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
    
    #Metodo guardar
    def self.save 
      
    end


    #create
    def self.create(params)
      columns = params.keys.join(',') 
      values = params.values.map {|v| "'#{v}'"}.join(',')
      query = "insert into #{table_name} (#{columns}) values (#{values});"

      execute_query(query)
    end

    #busca el valor y lo asigna conexion base de datos
    def self.client
      $client ||= ActiveRecord::Client.new
    end

    #busca el query y ejecuta
    def self.execute_query(query = '')
      client.execute_query(query)
    end 

    def self.find(id)
      results = execute_query("select * from #{table_name} where id = #{id};")
      raise ("RecordNotFound")if results.cmd_tuples.zero?

      true

      new(results.each.first)
      
    end

    def self.all   
     
      results = execute_query("select * from #{table_name};")

      results.each.map {|row| new(row)}
    end
    
    def self.destroy(id)
      results = execute_query("delete from #{table_name} where id = #{id};")

      raise ("RecordNotFound")if results.cmd_tuples.zero?

      true

    end
    
    def self.table_name
      raise("NotImplementedError")
    end

  end
end

  
    

