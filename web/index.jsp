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
<h1 align="center" style="color:whitesmoke;>">Fact or Fiction</h1>

<section id="pricing-table">
    <div class="container">
        <div class="row">
            <div class="pricing">

                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">Play</p>
                            <a href="/getRandomStory" class="btn btn-custom">Click me to start</a>
                        </div>

                        <div class="pricing-list">
                            <ul>
                                <li><i class="fa fa-smile-o"></i>Take a deep breath. Get ready!</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="pricing-table">
                        <div class="pricing-header">
                            <p class="pricing-title">Add</p>
                            <a href="/addStory" class="btn btn-custom">Click me to start</a>
                        </div>

                        <div class="pricing-list">
                            <ul>
                                <li><i class="fa fa-smile-o"></i>No code review is needed.</li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
</body>
</html>