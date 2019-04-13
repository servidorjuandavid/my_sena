class Student
    attr_accessor :nombre, :fecha_nacimiento, :correo, :programa

    def initialize(nombre, fecha_nacimiento, correo, programa)
        self.nombre = nombre
        self.fecha_nacimiento = fecha_nacimiento
        self.correo = correo
        self.programa = programa
    end

    def self.all
        [
            Student.new("Juan Carlos","07/08/1989",'jcar89@gmail.com', "Adsi"),
            Student.new("Juan David","28/07/1979",'jder78@gmail.com', "Adsi"),
            Student.new("Juan Esteban","03/08/1988",'jcfer9@gmail.com', "Adsi"),
            Student.new("Maria","05/08/1987",'mgg89@gmail.com', "Adsi"),
            Student.new("Luisa","17/08/1986",'lui89@gmail.com', "Adsi"),
            Student.new("Ruben","27/08/1988",'rube89@gmail.com', "Adsi")

        ]
    end

end
