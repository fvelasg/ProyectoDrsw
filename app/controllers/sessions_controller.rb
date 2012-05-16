class SessionsController < ApplicationController
  def new
     
   end
   
   def create
    @usuario=User.where("nombre = ? and clave = ?",params[:user],params[:password]).first()
     if(!@usuario.nil?)
       session[:userdata]=@usuario.nombre
       redirect_to reserves_path
     else
       redirect_to new_session_path, :notice => 'Autenticacion fallida'
     end
  end


  def destroy
    reset_session
    redirect_to reserves_path, :notice => 'Sesion terminada'
  end 
end
