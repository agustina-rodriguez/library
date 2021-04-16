class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
end
# está puesto para que aparezca lo del logueo en el caso de querer crear un libro
