class StudentsController < ApplicationController

    # Construimos la ruta por la cual se cargaran las vistas
    Tilt.register Tilt::ERBTemplate, 'html.erb'

    set :views, File.join(APP_ROOT, 'app', 'views', 'students')

    #GET /students
    get "/" do 
        @students = Student.all  #llamamos al metodo all de la clase Student
        erb :index
    end

    # Post recibe parametros
    post '/' do
        Student.create(student_params)
       
        redirect '/students'
    end


    #GET /students/new
    get '/new' do
        erb :new
            
    end


    #GET /usuarios/id
    get "/:id" do
        id=params[:id]
        @student = Student.find(id)
        erb :show
    end

    post '/' do
        Student.create(student_params)
        redirect 'students'
        
    end

    delete '/:id' do
        
        Student.destroy(params[:id])

        redirect "/students"
        
    end

    #me devuelve los parametros que vienen desde new.html.erb
    
    def student_params
        params[:student]
    end
    
end 
