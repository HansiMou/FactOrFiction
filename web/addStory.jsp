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
                            <p class="pricing-title">Add</p>
                        </div>

                        <div class="pricing-list">
                            <form action="addToDatabase">
                                Question:
                                <input type="text" name="question" required>
                                <br>
                                <select name="fact" required>
                                    <option value="fact">fact</option>
                                    <option value="fiction">fiction</option>
                                </select>
                                <br>
                                Explanation:
                                <input type="text" name="answer">
                                <br>
                                Creator(ldap such as hansmou):
                                <input type="text" name="creator">
                                <br><br>
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
</body>
</html>