class Teacher < Storage::Base
	attr_accessor :nombre, :fecha_nacimiento, :correo, :programa

	def initialize(nombre, fecha_nacimiento, correo, programa)
		self.nombre = nombre
		self.fecha_nacimiento = fecha_nacimiento
		self.correo = correo
		self.programa = programa
	end

	def self.table_name
		'teachers'
	end
end