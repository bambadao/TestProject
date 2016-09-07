<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="gs_sortable.js"></script>
<link type="text/css" rel="stylesheet" href="table.css" />

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.mycompany.testproject.model.Part" %>

<%
    List<Part> parts = new ArrayList<Part>();
    parts = (List<Part>) request.getAttribute("parts");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $(function() {
               $("#datepicker1").datepicker({ dateFormat: "M d, yy" }).val();
               $("#datepicker2").datepicker({ dateFormat: "M d, yy" }).val();
               $("#datepicker3").datepicker({ dateFormat: "M d, yy" }).val();
               $("#datepicker4").datepicker({ dateFormat: "M d, yy" }).val();
             });
        </script>
        <script type="text/javascript">
        <!--
            var TSort_Data = new Array ('my_table', 's', 's', 's', 'i', 'd', 'd'); 
            tsRegister();
            // -->
        </script>
    </head>
    <body>
        <form method="post" id="search"></form>
        <table cellspacing="0" cellpadding="5" rules="rows">
            <tr>
                <th colspan="2">Filter</th>
            </tr>
            <tr>
                <td class="st" width="30%">PN</td>
                <td width="70%"><input type="text" name="number"   size="50" form="search" value="<%=request.getParameter("number")!= null ? request.getParameter("number") : ""%>"></td>
            </tr>
            <tr>
                <td class="st" width="30%">Part Name</td>
                <td width="70%"><input type="text" name="name" form="search" value="<%=request.getParameter("name")!= null ? request.getParameter("name") : ""%>"></td>
            </tr>
            <tr>
                <td class="st" width="30%">Vendor</td>
                <td width="70%"><input type="text" name="vendor" form="search" value="<%=request.getParameter("vendor")!= null ? request.getParameter("vendor") : ""%>"></td>
            </tr>
            <tr>
                <td class="st" width="30%">Qty</td>
                <td width="70%"><input type="text" name="qty" form="search" value="<%=request.getParameter("qty")!= null ? request.getParameter("qty") : ""%>"></td>
            </tr>
            <tr>
                <td class="st" width="30%">Shipped</td>
                <td width="70%">                    
                    after
                        <input type="text" id="datepicker1" name="shipAfter" form="search" value="<%=request.getParameter("shipAfter")!= null ? request.getParameter("shipAfter") : ""%>">
                    before
                       <input type="text" id="datepicker2" name="shipBefore" form="search" value="<%=request.getParameter("shipBefore")!= null ? request.getParameter("shipBefore") : ""%>">
                </td>
            </tr>
            <tr>
                <td class="st" width="30%">Received</td>
                <td width="70%">                    
                    after
                        <input type="text" id="datepicker3" name="recAfter" form="search" value="<%=request.getParameter("recAfter")!= null ? request.getParameter("recAfter") : ""%>">
                    before
                        <input type="text" id="datepicker4" name="recBefore" form="search" value="<%=request.getParameter("recBefore")!= null ? request.getParameter("recBefore") : ""%>">
                </td>
            </tr>
        </table>
        <br>
        <div style="text-align:center">  
            <button class="button"  form="search">Filter</button>  
        </div>         
        <br>
        <table id="my_table" cellspacing="0" cellpadding="5" border="1" >
            <thead>
            <tr>
                <th class="lc">PN</th>
                <th class="lc">Part Name</th>
                <th class="lc">Vendor</th>
                <th class="lc">Qty</th>
                <th class="lc">Shipped</th>
                <th class="lc">Receive</th>
            </tr>
            </thead>
            <% if(parts != null) {
                SimpleDateFormat format = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);
		for (Part part:parts) {%>
                    <tr>
        		<td><%=part.getNumber()%></td>
                        <td><%=part.getName()%></td>
                        <td><%=part.getVendor()%></td>
                        <td><%=part.getQty()%></td>
                        <td><%=format.format(part.getShipped())%></td>
                        <td><%=format.format(part.getReceive())%></td>
                    </tr>
		<%} 
                }%>
        </table
    </body>
</html>
