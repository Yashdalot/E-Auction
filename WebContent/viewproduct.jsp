<%@page import="Product.BidBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="Userhomedefault.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="main.css">
<title>Product Details</title>
</head>
<style>
.divide {
	display: flex;
	flex-gap: 60px;
	flex-template-columns: auto auto auto;
	padding: 10px;
}

.divide1 {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid rgba(0, 0, 0, 0.8); margin = auto;
	padding: 10px;
	font-size: 30px;
	text-align: center;
	width: 300px;
	height: 140px;
}

.divide2 {
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	font-size: 20px;
	text-align: center;
	width: 300px;
	height: 20px;
}
</style>
<body>
	<%
		ProductBean pb = (ProductBean) request.getAttribute("Product");
		ArrayList<BidBean> Topbids = (ArrayList<BidBean>) request.getAttribute("Topbids");
		long millies = System.currentTimeMillis();
		java.sql.Date current_date = new java.sql.Date(millies);
		
		
	%>
	<br>
	<br>
	<br>
	<br>
	<h4 align="center">
		<font size="4" color="Blue">Product Details</font>
	</h4>
	<div class="div1">
		<img src="Image/<%=pb.getprid() %>.jpg" width="250" height="250" border="1">
		<h2><%=pb.getname()%></h2>
		<h2><%=pb.getcat()%></h2>

		<div class="div2">
			<h4><%=pb.getdesc()%></h4>
		</div>
		<br>
		<div class="grid-container">
			<div class="grid-item">
				Base Price
				<%=pb.getprice()%>
			</div>

			<div class="grid-item">
				Start Date
				<div class="grid item2">
				
					<%
					
					if(pb.getStart_date().before(current_date))
					{
					%>Auction Started
					<%}else{
						%>
					<%=pb.getStart_date() %>
					<%} %>
					</div>

			</div>
			<div class="grid-item">
				End Date
				<div class="grid item2"><%=pb.getLast_date()%></div>
					</div>

			</div>

		</div>
		<br>
		<br>
		<br>
		<div class="divide">

			<%
				if (pb.getLast_date().before(current_date)) {
					//Products whose auction is Ended
			%>

			<H3>You can't Bid Now.....Auction is CLOSED!!!!</H3>
			
			<%
				} else {

					//Products Whose Auction is Ongoing
			%>
			<div class="divide1">

				<form action="Bid" method="post">
					<input type="hidden" name="prid" value=<%=pb.getprid()%>>
					<input type="hidden" name="base_price" value=<%=pb.getprice()%>>
					<input type="number" placeholder="Your Bid" name="bidamt">
					<button type="submit" class="button button3">Bid</button>
				</form>
			</div>
			<div class="divide1">
				<div class="divide" align="center">
					<br>

					<h3 align="center">
						<font size="4" color="Blue"> Top 3 bids are:-</font>
					</h3>
					<br>
					<br>
					<table class="bottomBorder" align="center" border="0.5rem"
						width="70%">
						<tr>
							<%
								if (Topbids.size() > 0) {
										try {
											for (int i = 0; i < Topbids.size(); i++) {
												BidBean b = null;
												b = Topbids.get(i);
							%>

							<td>
								</h3> <%=b.getprice()%></h3>
							</td>
						</tr>
						<%
							}
									} catch (Exception e) {
										out.println(e);
									}
								} else {
						%>
						<br>
						<br>
						<br>
						<br>
						<h3>No Biding Till Now.....</h3>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>






		</div>
</body>
</html>