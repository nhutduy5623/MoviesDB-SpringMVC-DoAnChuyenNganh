<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page title area start -->
<%@include file="/common/taglib.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
      table {
        border-collapse: collapse;
        table-layout: fixed;
        width: 100%;
      }
      table td {
        word-wrap: break-word;
      }
      tr th{
      	align-items: center;
      	text-align: center;
      }
    </style>
<div class="page-title-area">
    <div class="row align-items-center">
        <div class="col-sm-6">
            <div class="breadcrumbs-area clearfix">
                <h4 class="page-title">Related Party Management</h4>
                <ul class="breadcrumbs pull-left">
                    <li><a href="home">Home</a></li>
                    <li><span>Related Party Management</span></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-6 clearfix">
            <div class="user-profile pull-right">
                <img class="avatar user-thumb" src="<c:url value='/template/admin/assets/images/author/avatar.png'/>" alt="avatar">
                <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Kumkum Rai <i class="fa fa-angle-down"></i></h4>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Message</a>
                    <a class="dropdown-item" href="#">Settings</a>
                    <a class="dropdown-item" href="#">Log Out</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- page title area end -->
<div class="main-content-inner">
    <div class="row">
        <!-- data table start -->
        <div class="col-12 mt-5">
            <div class="card">
                <div class="card-body" style="padding-top: 0%">
                    <div style="width:100%; display: flex; flex-direction: columns; justify-content: space-around; align-content: center; margin: 2% 0% ; text-align: center;">
	                    <div  style="text-align: left; margin: auto 0%; flex: 1"><p class="header-title" style="padding: 0%; margin: 0%">Related Party Data</p></div>
						<div class="form-group" style="display: flex; justify-content: center; margin: 0; flex: 1; height: 150%">
	                        <select id="roleFilter" class="roleFilter form-control" style="margin:auto; width: 40%; padding: 0; text-align: center"> 
		                    		<option value="-">--Chọn vai trò--</option>
		                    		<c:forEach var="item" items="${roleList}">
		                    			<option value="${item.code}">${item.name}</option>
		                    		</c:forEach>	                    		
		                    </select>
                        </div>
	                    <div style="display: flex; justify-content: center; flex: 1">
	                    	
	                    </div>
	                    <a href="relatedparty/save"><button type="button" class="btn btn-primary"><div class="fw-icons"><i class="fa fa-plus-square" style="margin-right: 2px"></i> Add New</div></button></a>
                    </div>
                    <div class="data-tables">
                        <table id="dataTable" class="text-center">
                            <thead class="bg-light text-capitalize">
                                <tr>
                                	<th>Code</th>
                                    <th>Name</th>
                                    <th>Avatar</th>
                                    <th>Follower Count</th>
                                    <th>Overview</th>
                                    <th>Website</th>
                                    <th>Role Code</th>
                                    <th>Status</th>
                                    <th>Modified By</th>
                                    <th>Tool</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${model.listResults}">
                                	<tr>
	                                    <td>${item.code}</td>
	                                    <td>${item.name}</td>
	                                    <td><img style="padding: 10%; border-radius: 1%" src="<c:url value='${item.avatar}'/>"></td>
	                                    <td>${item.followerCount}</td>
	                                    <td>${item.overview}</td>
	                                    <td>${item.website}</td>
	                                    <td><a href="relatedpartyrole?search=${item.roleCode}">${item.roleCode}</a></td>
	                                    <td>${item.status}</td>
	                                    <td>${item.modifiedBy}</td>
	                                    <td >
	                                   		<div class="fw-icons">
	                                   			<a href="relatedparty/edit?id=${item.id}"><i class="fa fa-wrench"></i>Edit</a>
	                                    	</div>
	                                    	<div class="fw-icons" id="${item.id}">
	                                    		<a href="#" class="btnDelete" onclick="onClickBtnDelete()"  id="btnDelete_${item.id}"><i class="fa fa-trash"></i>Delete</a>
	                                    	</div>                            
	                                    </td>
                                	</tr>  
                                </c:forEach>                              
                            </tbody>
                        </table>
                    </div>
                    <!-- Pagination -->
                    <div style="width: 100%; display: flex; justify-content: space-between; align-items: center">
                    	<form id="formChangePage" action="relatedparty" method="get" style="height: 50%; margin: auto 0;">
                    		Max page item:
	                		<select class="form-control" name="limit" id="maxPageItem" style="width: 100%; height: 100%">
	                               <option value="2">2</option>
	                               <option value="5" selected="selected">5</option>
	                               <option value="10">10</option>
	                               <option value="20">20</option>
	                        </select>
	                		<input type="hidden" value="${model.nextPage}" name="page" id="nextPage" /> 
                			<input type="hidden" value="${model.searchValue}" name="search" id="search" /> 
                			<input type="hidden" value="${roleCode}" name="roleCode" id="roleCode" /> 
                		</form>
                    	<ul class="pagination" id="pagination1" style="right: 1px; position: relative;"></ul>
                    </div>
                	
                </div>
            </div>
        </div>
        <!-- data table end -->
         
    </div>
   	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.js"></script>
   	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
   	<script src="<c:url value='/template/paging/jq-paginator.js'/>"></script>
    <script type="text/javascript">
    var totalPages = ${model.totalPages};
	var currentPage = ${model.nextPage};
	var maxPageItem = ${model.limit};   
	$("#maxPageItem").val(maxPageItem).change();	
	var roleCode = '${roleCode}'; 
	$("#roleFilter").val(roleCode).change();
	$.jqPaginator('#pagination1', {
		totalPages : totalPages,
		visiblePages : 5,
		currentPage : currentPage,
		onPageChange : function(nextPage, type) {			
			if (type != "init") {
				$("#nextPage").val(nextPage);	
				$("#formChangePage").submit();
			}
		}
	});	
	$('#maxPageItem').on('change', function (e) {
		$("#nextPage").val(1);
		$("#formChangePage").submit();			
	});
	$('#roleFilter').on('change', function (e) {
		$("#nextPage").val(1);
		$('#roleCode').val($(this).val());
		$("#formChangePage").submit();			
	});
	</script>
	<!-- Search -->
	<script type="text/javascript">
	$("#formSearchInput").attr('action')="relatedparty";
	</script>
	
	
	<c:url var="restAPI_URL" value="/api/admin/relatedparty"/>
	<script type="text/javascript">

	$(".btnDelete").click(function(e){
		e.preventDefault();
		var idElement = $(this).attr('id');
		var id = idElement.split("btnDelete_")[1];
		swal({
			  title: "Xác nhận xóa",
			  text: "Bạn có chắc chắn muốn xóa hay không",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-success",
			  cancelButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			}).then(function(isConfirm) {				
			  if (isConfirm['value']) {	
				  var data={};
				  ids = [];
				  ids.push(id);	
				  deleteElement(ids)
			  } 
			});
	})
	
	function warningBeforeDelete(id) {
			
		} 
		function deleteElement(data) {
		    $.ajax({
		        url: '${restAPI_URL}',
		        type: 'DELETE',
		        contentType: 'application/json',
		        data: JSON.stringify(data),
		        success: function (result) {
		            window.location.href = "${newURL}?page="+currentPage+"&limit="+maxPageItem+"&message=delete_success";
		        },
		        error: function (error) {
		        	console.log(error)
		        }
		    });
		}
		
	</script>
</div>
