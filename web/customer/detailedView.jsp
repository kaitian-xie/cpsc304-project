<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%--
    Document   : detailedView
    Created on : 26-Mar-2018, 2:34:54 AM
    Author     : Darren
--%>

<%
    String propertyId = request.getParameter("property_id");
    String typeId = request.getParameter("type_id");
    String tableToJoin = typeId.equals("rental") ? "ForRent" : "ForSale";
    String typeString = typeId.equals("rental") ? "For Rent" : "For Sale";

    String propertyDetailsSql = "select Property.*, Postalcode.*, {{tableName}}.price "
            + "from Property, PostalCode, {{tableName}} "
            + "WHERE Property.postal_code = PostalCode.postal_code "
            + "AND {{tableName}}.property_id = Property.property_id "
            + "AND " + propertyId + " = Property.property_id";

    propertyDetailsSql = propertyDetailsSql.replace("{{tableName}}", tableToJoin);
    System.out.println("propertyDetailsSql string: " + propertyDetailsSql);

    String roomsSql = "select Room.* from Room INNER JOIN Property ON Property.property_id = Room.property_id "
            + "WHERE " + propertyId + " = Property.property_id";

    pageContext.setAttribute("propertyDetailsSql", propertyDetailsSql);
    pageContext.setAttribute("roomsSql", roomsSql);
    pageContext.setAttribute("typeString", typeString);
%>
<sql:query var="propertyQuery" dataSource="jdbc/RentalSite">
    <c:out value="${propertyDetailsSql}"/>
</sql:query>

<sql:query var="rooms" dataSource="jdbc/RentalSite">
    <c:out value="${roomsSql}"/>
</sql:query>

<sql:query var="realtorQuery" dataSource="jdbc/RentalSite">
    SELECT R.*, O.* FROM Realtor R
    INNER JOIN Property P ON R.realtor_id = P.realtor_id
    INNER JOIN RealtyOffice O ON R.branch_id = O.branch_id
    where P.property_id = '${param.property_id}';
</sql:query>

<c:set var="propertyDetails" value="${propertyQuery.rows[0]}"/>
<c:set var="realtorDetails" value="${realtorQuery.rows[0]}"/>


<script>
    $(function () {
        $(".submit-button").on("click", function () {
            var url = [location.protocol, '//', location.host, "/RentalSite/customer/createCustomerContactRealtor.jsp?"].join('');
            var $realtorContactForm = $(".realtor-contact-form");
            var uriParams = {
                "realtor_id": $realtorContactForm.attr("realtor_id"),
                "customer_name": $realtorContactForm.find("#form-name").val(),
                "customer_email": $realtorContactForm.find("#form-email").val(),
                "customer_phone": $realtorContactForm.find("#form-phone").val(),
                "customer_message": $realtorContactForm.find("#form-contact-message").val(),
            }

            var uri = Object.keys(uriParams).map(key => {
                return [key, uriParams[key]].map(encodeURIComponent).join("=");
            }).join("&");

            $.ajax(url + uri, {
                success: result => {
                    alert("success");
                    console.log(result);
                },
                error: err => {
                    alert("Sorry, the email address is invalid");
                    console.log(err);
                }
            });
        });
    });
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="upside-down-nav">
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-map" role="tabpanel" aria-labelledby="nav-map-tab" address="${propertyDetails.address}, ${propertyDetails.city}, ${propertyDetails.province}">
                            <div id="map-canvas" style="width:100%; height:500px;"></div>
                        </div>
                        <div class="tab-pane fade" id="nav-gallery" role="tabpanel" aria-labelledby="nav-gallery-tab">
                            <div id="carouselGalleryIndicators" class="carousel slide gallery" data-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach var="row2" items="${rooms.rows}" varStatus="myIndex">
                                        <c:choose>
                                            <c:when test="${myIndex.index=='0'}">
                                                <div class="carousel-item active">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="carousel-item">
                                                    </c:otherwise>
                                                </c:choose>
                                                <img src="${row2.image_url}" style="width: 100%; height:auto;" alt="...">
                                            </div>
                                        </c:forEach>
                                        <div>
                                            <div class="carousel-item" style="width: 100%; height:auto;" alt="...">
                                                <img src="${propertyDetails.image_url}">
                                            </div>
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselGalleryIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselGalleryIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-map-tab" data-toggle="tab" href="#nav-map" role="tab" aria-controls="nav-home" aria-selected="true">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <span>Map</span>
                                </a>
                                <a class="nav-item nav-link" id="nav-gallery-tab" data-toggle="tab" href="#nav-gallery" role="tab" aria-controls="nav-profile" aria-selected="false">
                                    <span class="gallery-icon">
                                        <i class="fas fa-th"></i>
                                    </span>
                                    <span>Gallery</span>
                                </a>
                            </div>
                        </nav>

                    </div>
                    <div class="propertyDescriptionHeader">
                        <h1>
                            ${propertyDetails.address}
                            <span>
                                ${propertyDetails.city}, ${propertyDetails.province} ${propertyDetails.postal_code}
                            </span>
                        </h1>
                        <h3>
                            ${propertyDetails.property_type} &middot ${propertyDetails.num_beds} beds &middot ${propertyDetails.sq_ft} sqft
                        </h3>
                    </div>
                    <div class="propertyPriceDetails">
                        <h1>${typeString}</h1>
                        <h2>$${propertyDetails.price}</h2>
                    </div>

                    <div class="propertyDescription">
                        TODO
                    </div>

                    <div class="realtorContactInfo">
                        <div class="card">
                            <div class="card-header">
                                Realtor Contact Info
                            </div>
                            <div class="card-body realtor-details">
                                <p class="card-text">
                                    ${realtorDetails.name}<br>
                                    ${realtorDetails.phone}<br>
                                    ${realtorDetails.email}
                                </p>
                            </div>
                            <div class="card-body realtor-contact-form" realtor_id="${realtorDetails.realtor_id}">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-user"></i>
                                        </span>
                                    </div>
                                    <input id="form-name" type="text" class="form-control" aria-label="Name" placeholder="Your Name">
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-phone"></i>
                                        </span>
                                    </div>
                                    <input id="form-phone" type="text" class="form-control" aria-label="Phone" placeholder="Phone Number">
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-envelope"></i>
                                        </span>
                                    </div>
                                    <input id="form-email" type="text" class="form-control" aria-label="Email" placeholder="Email">
                                </div>

                                <div class="input-group">
                                    <textarea id="form-contact-message" class="form-control" aria-label="Contact Message" placeholder="Contact Message"></textarea>
                                </div>

                                <a href="#" class="btn btn-primary submit-button">Submit</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
