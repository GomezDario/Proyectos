<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1 class="col-sm-6 mb-3 mb-sm-3">Alta Usuarios</h1>

    <form class="user" action="SvUsuarios" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                                            placeholder="Nombre Usuario">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                                            placeholder="Contraseña">
                                    </div>
                                    <!-- La referencia que toma el servlet no es el Id, es el name del input -->
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="rol" name="rol" 
                                            placeholder="Rol">
                                    </div>
                                </div>
                                
                                <!-- Aca va a ir todo lo que respecta a horario y usuarios -->
                                
                                <button class="btn btn-primary btn-user btn-block" type="submit">
                                    Crear Usuario
                                </button>>
                               
                                
                            </form>


<%@include file="components/bodyfinal.jsp"%>
