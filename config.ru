require_relative 'boot.rb'

map ("/students") { run StudentsController }
map ("/teachers") { run TeachersController }