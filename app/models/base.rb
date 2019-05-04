module Storage

  class Base

    #{atributos nombre, correo, fecha naciemiento, programa}
    def initialize(params = {})
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
        self.class.send(:define_method, key) do
          instance_variable_get("@#{key}")
        end
      end
    end

    def save
      headers = self.class.file_headers
      colletion = self.class.all

      colletion << self

      CSV.open(self.class.file_path, 'w') do |csv|
        csv << headers
        colletion.each do |record|
          values = headers.map do |header|
            record.send(header)
          end    
        csv << values
        end
      end
    end

    def self.file_headers
      CSV.open(file_path, &:readline)
    end

    
    def self.all        
      CSV.foreach(file_path, headers: true).map { |item|new(item)}
    end
    
    def self.file_path 
      File.join(APP_ROOT, 'db',"#{table_name}.csv")
    end

    def self.table_name
      raise("NotImplementedError")
    end

  end
end