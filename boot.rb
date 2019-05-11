require 'sinatra'


APP_ROOT = File.dirname(__FILE__)

require_relative "app/controllers/application_controller.rb"
require_relative "app/controllers/students_controller.rb"
require_relative "app/controllers/teachers_controller.rb"


require_relative "app/models/active_record.rb"
require_relative "app/models/student.rb"
require_relative "app/models/teacher.rb"
