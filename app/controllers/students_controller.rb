class StudentsController < ApplicationController
    Tilt.register Tilt::ERBTemplate, 'html.erb'
    set :views, File.join(APP_ROOT, 'app', 'views', 'students')

    get "/" do 
        @students = Student.all
        erb :index
    end

    get "/:id" do
        id=params[:id].to_i
        @student = Student.all[id]
        erb :show
    end

end 
