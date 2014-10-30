<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- For Back button and Refresh -->
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", 0);
%>
<html> <!-- The problem was having different folders, so place all css files in CSS folder. -->
 <!-- Bootstrap css -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap-theme.css" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css" />

<!-- Jquery CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.theme.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.theme.min.css" media="screen"/>

<!-- Jquery JS Files -->  
<script src="<%=request.getContextPath()%>/js/jquery.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"  type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"  type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/js/verify.notify.js"></script>
<!-- bootstap js -->

<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

</head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- For Back button and Refresh -->
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>I.R.A Bank</title>
</head>
<body>

<nav class="navbar navbar-default " role="navigation">
<div class="container">
        <p class="navbar-text navbar-right"><a href="<%=request.getContextPath()%>/ExternalUsers/Issues" class="navbar-link">Submit an Issue</a></p>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">

                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">I.R.A Bank</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse  navbar-collapse navbar-ex1-collapse">
             
             <ul class="nav navbar-nav">
                    <!-- Accounts -->
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                    Accounts <span class="caret"></span>
                    </button>
                    
                     <!--  Admin -->   
                    <ul class="dropdown-menu  dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="<%=request.getContextPath()%>/admin/listAccounts">User Accounts Management</a></li>
                         </sec:authorize>    
                        <!-- User -->
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_MERCHANT')">
                            <li><a href="<%=request.getContextPath()%>/user/showAccountInfo">My Account Details</a></li>
                        </sec:authorize>  
                      </ul>
                </div>

                     
                     <!-- Functionalities -->
                     <!-- credit debit -->

                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                    External Transactions <span class="caret"></span>
                    </button>
                    
                     <!--  Admin -->   
                    <ul class="dropdown-menu  dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu2">
                    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_MERCHANT')">
                         <li><a href="<%=request.getContextPath()%>/ExternalUsers/credit_debit">Credit/Debit Transactions</a></li>
                          <!-- transfer funds -->
                        <li><a href="<%=request.getContextPath()%>/ExternalUsers/Transfer_funds">Transfer Funds</a></li>
                        <!-- Bill pay -->
                        <li><a href="<%=request.getContextPath()%>/pages/ExternalUsers/BillpayUser.jsp">User Billpay</a></li>
                        <li><a href="<%=request.getContextPath()%>/pages/ExternalUsers/Billpaymerchant.jsp">Merchant Billpay</a></li>
                        <li><a href="<%=request.getContextPath()%>/pages/ExternalUsers/user_profile.jsp">My Profile</a></li>
                    </sec:authorize>  
                      </ul>
                </div>

                    
                      <!-- Issues -->
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                    Issues <span class="caret"></span>
                    </button>
                     
                    <ul class="dropdown-menu  dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
                        <!-- User -->
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_MERCHANT')">
                            <li><a href="<%=request.getContextPath()%>/ExternalUsers/Issues">New Issue</a></li>
                        </sec:authorize>  

                        <!-- User -->
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_MERCHANT')">
                            <li><a href="<%=request.getContextPath()%>/ExternalUsers/Issues">My Issues</a></li>
                        </sec:authorize>  

                        <!-- Admin -->
                      <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="<%=request.getContextPath()%>/admin/listAccounts">View Pending Issues</a></li>
                     </sec:authorize> 

                    </ul>
                </div>       
                        
                        
                <!--  Transactions -->

                  <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                    Internal Transactions <span class="caret"></span>
                    </button>
                    
                     <!--  Admin -->   
                    <ul class="dropdown-menu  dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu2">
                    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_MERCHANT')">
                          <li><a href="<%=request.getContextPath()%>/ExternalUsers/Request">Request Transactions</a></li>
                             <li><a href="<%=request.getContextPath()%>/ExternalUsers/listTransactions">My Transactions</a></li>
                    </sec:authorize>  

                      <!-- Admin -->
                      <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li><a href="<%=request.getContextPath()%>/admin/listTransactions">View All Transactions</a></li>
                     </sec:authorize> 


                      </ul>
                </div>
            		    
            		
            			<!--  TODO Rakesh to add : 
            			 View all pending/non-pending transactions - admin
            			 --> 
            			
            			 <!--  Admin view Issues -->
            			  
            			  <!-- Admin view Trans.requests -->
                 </ul>
                
            </div>
        
        </div>
        <!-- /.container -->
    </nav>
</body>
 <!-- JavaScript -->
    <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</html>

