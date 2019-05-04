class TeachersController < ApplicationController
    Tilt.register Tilt::ERBTemplate, 'html.erb'
    
    set :views, File.join(APP_ROOT, 'app', 'views', 'teachers')
    
    
    #GET /teachers
    get "/" do 
        @teachers = Teacher.all
        erb :index
    end

    # Post recibe parametros
    post '/' do
        teacher = Teacher.new(teacher_params)

        teacher.save

        redirect '/teachers'
       
    end
    
    #GET /teachers/new
    get '/new' do
        erb :new
            
    end

    #GET /teacher/id
    get "/:id" do
        id=params[:id].to_i
        @teachers = Teacher.all[id]
        erb :show
    end

   

    def teacher_params
        params[:teacher]
    end

end 
