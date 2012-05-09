class SessionsController < ApplicationController
  def new
     
   end
   
   def create
    @users=User.all
    @users.each do |t|
      if (params[:user]==t.nombre&& params[:password]==t.clave)
        session[:userdata]=t.nombre
        redirect_to reserves_path
      else
        redirect_to new_session_path, :notice => 'Autenticacion fallida'
      end  
    end
  end


  def destroy
    reset_session
    redirect_to reserves_path, :notice => 'Sesion terminada'
  end 
end
