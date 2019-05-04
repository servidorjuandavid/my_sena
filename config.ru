require "sinatra"
require "csv"

APP_ROOT = File.dirname(__FILE__)

require_relative "app/controllers/application_controller"
require_relative "app/controllers/students_controller"
require_relative "app/controllers/teachers_controller"


require_relative "app/models/base"
require_relative "app/models/student"
require_relative "app/models/teacher"

map ("/students") { run StudentsController }
map ("/teachers") { run TeachersController }