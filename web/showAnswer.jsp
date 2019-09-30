<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fact or Fiction</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">

    <!--Icon Fonts-->
    <link rel="stylesheet" media="screen" href="assets/fonts/font-awesome/font-awesome.min.css" />

</head>

<body>
<h1 align="center" style="color:whitesmoke;>">Random Story</h1>

<section id="pricing-table">
    <div class="container">
        <div class="row">
            <div class="pricing">

                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">
                                <%
                                    boolean guess = Boolean.parseBoolean((String) request.getAttribute("fact"));
                                    boolean fact = (boolean) session.getAttribute("Fact");

                                    if (guess == fact) {
                                        out.print("Right");
                                    } else {
                                        out.print("Wrong");
                                    }
                                %>
                            </p>
                        </div>

                        <div class="pricing-list">
                            <ul>
                                <li><i class="fa fa-smile-o"></i>
                                    <%
                                        out.print(session.getAttribute("Question"));
                                    %>
                                </li>
                                <li><i class="fa fa-smile-o"></i>
                                    <%
                                        String rate = (String) session.getAttribute("Beaten");
                                        if (guess == fact) {
                                            if (rate.equals("N/A")) {
                                                out.print("Congrats! You provided the first data point which is right!");
                                            } else {
                                                out.print("Congrats! You have beaten " + rate + "%!");
                                            }
                                        } else {
                                            if (rate.equals("N/A")) {
                                                out.print(":( You provided the first data point which is wrong.");
                                            } else {
                                                out.print("You are not alone. You are among " + rate + "%.");
                                            }
                                        }
                                    %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">
                                <%
                                    if ((Boolean) (session.getAttribute("Fact"))) {
                                        out.print("Fact indeed.");
                                    } else {
                                        out.print("Pure Fiction.");
                                    }
                                %>
                            </p>
                            <a href="/getRandomStory" class="btn btn-custom">Next</a>
                            <a href="/" class="btn btn-custom">Main</a>
                        </div>

                        <div class="pricing-list">
                            <ul>
                                <li><i class="fa fa-smile-o"></i>
                                    <%
                                        out.print(session.getAttribute("Answer"));
                                    %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Pricing Table Section End -->
</body>
</html>