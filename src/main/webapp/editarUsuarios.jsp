<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1 class="col-sm-6 mb-3 mb-sm-3">Editar Usuarios</h1>

<% Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");%>


    <form class="user" action="SvEditUsuarios" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreUsu"
                                               placeholder="Nombre Usuario" value="<%=usu.getNombreUsuario()%>">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                                               placeholder="Contraseña" value="<%=usu.getContrasenia()%>">
                                    </div>
                                    <!-- La referencia que toma el servlet no es el Id, es el name del input -->
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="rol" name="rol" 
                                               placeholder="Rol" value="<%=usu.getRol()%>">
                                    </div>
                                </div>
                                
                                <!-- Aca va a ir todo lo que respecta a horario y usuarios -->
                                
                                <button class="btn btn-primary btn-user btn-block" type="submit">
                                    Guardar
                                </button>>
                               
                                
                            </form>


<%@include file="components/bodyfinal.jsp"%>