class TeachersController < ApplicationController
   
    set :views, File.join(APP_ROOT, 'app', 'views', 'teachers')

    get "/" do 
        @teachers = Teacher.all
        erb :index
    end

    get "/:id" do
        id=params[:id].to_i
        @teachers = Teacher.all[id]
        erb :show
    end

end 
