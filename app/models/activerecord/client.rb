require 'pg'

module ActiveRecord 
    #metodo conecta con la base de datos
    class Client
        def connection 
            @connection ||= PG.connect(
                dbname: 'my_sena',
                user: 'juanda',
                password: 'orlando2018'
            )
        end
        
        def execute_query(query)
            connection.exec(query)
        end
    end
    
end