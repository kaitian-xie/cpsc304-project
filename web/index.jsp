<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 11-Mar-2018, 6:31:20 PM
    Author     : Adi
--%>

<sql:query var="properties" dataSource="jdbc/RentalSite">
    SELECT Property.property_id, Property.address, Property.postal_code, Property.sq_ft, Forsale.price FROM Forsale
    INNER JOIN Property ON Forsale.property_id=Property.property_id;
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rental Site</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Rent Stuff</h1><table border="0">
            <thead>
                <tr>
                    <th>Housing Units</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td><form action="response.jsp">
                            <strong>Choose Property Type</strong>
                            <select name="type_id">
                                    <option value="both">Rental or Sale</option>
                                    <option value="rental">Rental</option>
                                    <option value="sale">Sale</option>
                            </select>
                            <br></br>
                           
                            <strong>Search by price range:</strong>
                            <select name="price_id">
                                    <option value="range0">Unlimited</option>
                                    <option value="range1">< 100 000</option>
                                    <option value="range2">100 000 - 500 000</option>
                                    <option value="range3">500 000 - 1 000 000</option>
                                    <option value="range4">> 1 000 000</option>
                            </select> 
                           
                            <br></br>
                            <strong>Search by footage:</strong>
                            <select name="sqft_id">
                                    <option value="footage0">Unlimited</option>
                                    <option value="footage1">< 1000 </option>
                                    <option value="footage2">1000 - 2500</option>
                                    <option value="footage3">> 2500</option>
                            </select>
                            <br></br>
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
    
