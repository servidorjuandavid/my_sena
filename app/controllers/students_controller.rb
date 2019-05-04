class StudentsController < ApplicationController
    Tilt.register Tilt::ERBTemplate, 'html.erb'

    set :views, File.join(APP_ROOT, 'app', 'views', 'students')

    #GET /students
    get "/" do 
        @students = Student.all
        erb :index
    end

    # Post recibe parametros
    post '/' do
        student = Student.new(student_params)

        student.save
        
        redirect '/students'
    end


    #GET /students/new
    get '/new' do
        erb :new
            
    end


    #GET /usuarios/id
    get "/:id" do
        id=params[:id].to_i
        @student = Student.all[id]
        erb :show
    end

   
    def student_params
        params[:student]
    end
    
end 
