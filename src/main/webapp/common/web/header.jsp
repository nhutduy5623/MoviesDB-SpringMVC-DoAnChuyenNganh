<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.laptrinhweb.util.SecurityUtil" %>
<%@include file="/common/taglib.jsp"%>
<!-- BEGIN | Header -->
<header class="ht-header full-width-hd">
		<div class="row" id="headerContainer">
			<nav id="mainNav" class="navbar navbar-default navbar-custom">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header logo">
				    <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					    <span class="sr-only">Toggle navigation</span>
					    <div id="nav-icon1">
							<span></span>
							<span></span>
							<span></span>
						</div>
				    </div>
				    <a href="<c:url value = '/home'/>"><img class="logo" src="<c:url value='/template/web/images/logo1.png'/>" alt="" width="119" height="58"></a>
			    </div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav flex-child-menu menu-left">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>
						<li class="dropdown first">
							<a class="btn btn-default lv1" href="<c:url value = '/home'/>" >
							Home
							</a>
						</li>	
						<li class="dropdown first">
							<a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
							movies<i class="fa fa-angle-down" aria-hidden="true"></i>
							</a>
							<ul class="dropdown-menu level1">
								<li><a href="<c:url value='/work'/>">All</a></li>
								<c:forEach var="genre" items="${genreList}">
									<li><a href="<c:url value='/work?genreCode=${genre.code}'/>">${genre.name}</a></li>
								</c:forEach>								
							</ul>
						</li>
						<li class="dropdown first">
							<a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
							Genres <i class="fa fa-angle-down" aria-hidden="true"></i>
							</a>
							<ul class="dropdown-menu level1">
								<li><a href="<c:url value='/genre'/>">Genre</a></li>
								<li><a href="<c:url value='/subgenre'/>">SubGenre</a></li>
							</ul>
						</li>
						<li class="dropdown first">
							<a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
							People <i class="fa fa-angle-down" aria-hidden="true"></i>
							</a>
							<ul class="dropdown-menu level1">
								<li><a href="<c:url value='/relatedparty'/>">ALL</a></li>
								<c:forEach var="people" items="${relatedPartyRoleList}"> 
									<li><a href="<c:url value='/relatedparty?roleCode=${people.code}'/>">${people.name}</a></li>
								</c:forEach>
							</ul>
						</li>						
						<li class="dropdown first">
							<a class="btn btn-default lv1" href="<c:url value = '/AiGenerate'/>" >
							Search With AI
							</a>
						</li>
					</ul>
					<ul class="nav navbar-nav flex-child-menu menu-right">
												
						<security:authorize access="isAnonymous()">
							<li class="loginLink"><a href="#">LOG In</a></li>
							<li class="btn signupLink"><a href="#">sign up</a></li>
						</security:authorize>	
						<security:authorize access="isAuthenticated()">
						<li class=" dropdown first ">
						
							<a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
							Wellcome, <%= SecurityUtil.getPrincipal().getFullName() %><i class="fa fa-angle-down" aria-hidden="true"></i>
							</a>
							<ul class="dropdown-menu level1">
								<%
								if (SecurityUtil.getAuthorities().contains("ADMIN_HOME")) {
								%>
								    <li><a href="<%= response.encodeURL(request.getContextPath() + "/admin/home") %>">Admin Page</a></li>
								<%
								}
								%>
								<li><a href="<c:url value='/profile'/>">My Profile</a></li>
								<li><a href="<c:url value='/userfavorite'/>">User Favorite List</a></li>
								<li><a href="<c:url value='/userrate'/>">Rated movies</a></li>
								
							</ul>
						</li>      
							<li class="btn"><a href="<c:url value='/logout'/>">Logout</a></li>
						</security:authorize>			
										
						
					</ul>
				</div>
			<!-- /.navbar-collapse -->
	    </nav>
	    <!-- search form -->
		</div>
	
</header>
<!-- END | Header -->