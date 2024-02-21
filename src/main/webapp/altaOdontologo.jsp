<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- incluye todo lo del jsp sin tener que copiar codigo -->
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1 class="col-sm-6 mb-3 mb-sm-3">Alta Odontologos</h1>

                            <form class="user">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="dni"
                                            placeholder="Dni">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="nombre"
                                            placeholder="Nombre">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="apellido"
                                            placeholder="Apellido">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="telefono"
                                            placeholder="Telefono">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="direccion"
                                            placeholder="Direccion">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="fechamac"
                                            placeholder="Fecha Nac">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-3">
                                        <input type="text" class="form-control form-control-user" id="especialidad"
                                            placeholder="Especialidad">
                                    </div>
                                </div>
                                
                                <!-- Aca va a ir todo lo que respecta a horario y usuarios -->
                                
                                <a href="#" class="btn btn-primary btn-user btn-block">
                                    Crear Odontologo
                                </a>
                                
                                
                            </form>


<%@include file="components/bodyfinal.jsp"%>
