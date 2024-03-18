<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Project</title>
        <script src="assets/jquery-3.6.0.min.js"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/style.css" />
    </head>

    <body>
        <div class="container-fluid vh-100 ptrn">
            <nav class="navbar navbar-expand-lg navbar-dark transparent-nav sticky">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/">
                        <!-- You can use an image or just text for the brand -->
                        <img src="" />ABC UNI
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item me-2">
                                <!--                                <button type="button" class="btn text-light" data-bs-toggle="modal"
                                                                        data-bs-target="#loginmodal">
                                                                    Log-in
                                                                </button>-->
                                <a class="nav-link text-light" href="signin.jsp">Log In</a>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="btn text-light" data-bs-toggle="modal"
                                        data-bs-target="#signupmodal">
                                    Sign-in
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container mt-4 text-light">
                <div class="jumbotron">
                    <h1 class="display-4">Welcome to My Website</h1>
                    <p class="lead">This is a simple home page.</p>
                    <hr class="my-4" />
                    <p>Please login or Signup</p>
                </div>
            </div>
        </div>

        <!-- Login Modal -->
        <div class="modal fade" id="loginmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content text-align-center">
                    <div class="form-container">
                        <p class="title">Login</p>
                        <form class="form" action="SignInController" method="post" id="login-form">
                            <div class="input-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" placeholder="" />
                            </div>
                            <div class="input-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" placeholder="" />
                                <div class="forgot">
                                    <a rel="noopener noreferrer" href="#">Forgot Password ?</a>
                                </div>
                            </div>
                            <div id="error-message" class="mb-2 text-danger"></div>
                            <button type="submit" name="loginsubmit" class="sign">
                                Log in
                            </button>
                        </form>
                        <div class="social-message">
                            <div class="line"></div>
                            <p class="message">Login with social accounts</p>
                            <div class="line"></div>
                        </div>
                        <div class="social-icons">
                            <button aria-label="Log in with Google" class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="w-5 h-5 fill-current">
                                <path
                                    d="M16.318 13.714v5.484h9.078c-0.37 2.354-2.745 6.901-9.078 6.901-5.458 0-9.917-4.521-9.917-10.099s4.458-10.099 9.917-10.099c3.109 0 5.193 1.318 6.38 2.464l4.339-4.182c-2.786-2.599-6.396-4.182-10.719-4.182-8.844 0-16 7.151-16 16s7.156 16 16 16c9.234 0 15.365-6.49 15.365-15.635 0-1.052-0.115-1.854-0.255-2.651z">
                                </path>
                                </svg>
                            </button>
                            <button aria-label="Log in with Twitter" class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="w-5 h-5 fill-current">
                                <path
                                    d="M31.937 6.093c-1.177 0.516-2.437 0.871-3.765 1.032 1.355-0.813 2.391-2.099 2.885-3.631-1.271 0.74-2.677 1.276-4.172 1.579-1.192-1.276-2.896-2.079-4.787-2.079-3.625 0-6.563 2.937-6.563 6.557 0 0.521 0.063 1.021 0.172 1.495-5.453-0.255-10.287-2.875-13.52-6.833-0.568 0.964-0.891 2.084-0.891 3.303 0 2.281 1.161 4.281 2.916 5.457-1.073-0.031-2.083-0.328-2.968-0.817v0.079c0 3.181 2.26 5.833 5.26 6.437-0.547 0.145-1.131 0.229-1.724 0.229-0.421 0-0.823-0.041-1.224-0.115 0.844 2.604 3.26 4.5 6.14 4.557-2.239 1.755-5.077 2.801-8.135 2.801-0.521 0-1.041-0.025-1.563-0.088 2.917 1.86 6.36 2.948 10.079 2.948 12.067 0 18.661-9.995 18.661-18.651 0-0.276 0-0.557-0.021-0.839 1.287-0.917 2.401-2.079 3.281-3.396z">
                                </path>
                                </svg>
                            </button>
                            <button aria-label="Log in with GitHub" class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="w-5 h-5 fill-current">
                                <path
                                    d="M16 0.396c-8.839 0-16 7.167-16 16 0 7.073 4.584 13.068 10.937 15.183 0.803 0.151 1.093-0.344 1.093-0.772 0-0.38-0.009-1.385-0.015-2.719-4.453 0.964-5.391-2.151-5.391-2.151-0.729-1.844-1.781-2.339-1.781-2.339-1.448-0.989 0.115-0.968 0.115-0.968 1.604 0.109 2.448 1.645 2.448 1.645 1.427 2.448 3.744 1.74 4.661 1.328 0.14-1.031 0.557-1.74 1.011-2.135-3.552-0.401-7.287-1.776-7.287-7.907 0-1.751 0.62-3.177 1.645-4.297-0.177-0.401-0.719-2.031 0.141-4.235 0 0 1.339-0.427 4.4 1.641 1.281-0.355 2.641-0.532 4-0.541 1.36 0.009 2.719 0.187 4 0.541 3.043-2.068 4.381-1.641 4.381-1.641 0.859 2.204 0.317 3.833 0.161 4.235 1.015 1.12 1.635 2.547 1.635 4.297 0 6.145-3.74 7.5-7.296 7.891 0.556 0.479 1.077 1.464 1.077 2.959 0 2.14-0.020 3.864-0.020 4.385 0 0.416 0.28 0.916 1.104 0.755 6.4-2.093 10.979-8.093 10.979-15.156 0-8.833-7.161-16-16-16z">
                                </path>
                                </svg>
                            </button>
                        </div>
                        <div class="text-center">
                            <p class="signup">
                                Don't have an account?
                                <a rel="noopener noreferrer" href="#" class="" data-bs-toggle="modal"
                                   data-bs-target="#signupmodal">Sign up</a>
                            </p>
                            <button type="button" class="btn text-light" data-bs-dismiss="modal" aria-label="Close">
                                Close
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Signup Modal -->
        <div class="modal fade" id="signupmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content text-align-center">
                    <div class="form-container">
                        <p class="title">Signin</p>
                        <form class="form" action="SignUpController" method="post" id="reg-form">
                            <div class="row input-group">
                                <div class="col">
                                    <label for="username">First Name</label>
                                    <input type="text" name="fname" class="form-control" placeholder="" aria-label="First name" />
                                </div>
                                <div class="col">
                                    <label for="username">Last Name</label>
                                    <input type="text" name="lname" class="form-control" placeholder="" aria-label="Last name" />
                                </div>
                            </div>
                            <div class="input-group">
                                <label for="username">Email</label>
                                <input type="email" name="email" placeholder="" />
                            </div>
                            <div class="input-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" placeholder="" />
                            </div>
                            <div class="input-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" placeholder="" />
                            </div>
                            <div id="error-message2" class="mb-2 text-danger"></div>
                            <button type="submit" name="signinsubmit" class="mt-3 sign">
                                Sign up
                            </button>
                        </form>
                        <!-- <div class="social-message">
                            <div class="line"></div>
                            <p class="message">Login with social accounts</p>
                            <div class="line"></div>
                        </div>
                        <div class="social-icons">
                            <button aria-label="Log in with Google" class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="w-5 h-5 fill-current">
                                    <path d="M16.318 13.714v5.484h9.078c-0.37 2.354-2.745 6.901-9.078 6.901-5.458 0-9.917-4.521-9.917-10.099s4.458-10.099 9.917-10.099c3.109 0 5.193 1.318 6.38 2.464l4.339-4.182c-2.786-2.599-6.396-4.182-10.719-4.182-8.844 0-16 7.151-16 16s7.156 16 16 16c9.234 0 15.365-6.49 15.365-15.635 0-1.052-0.115-1.854-0.255-2.651z">
                                    </path>
                                </svg>
                            </button>
                            <button aria-label="Log in with Twitter" class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="w-5 h-5 fill-current">
                                    <path d="M31.937 6.093c-1.177 0.516-2.437 0.871-3.765 1.032 1.355-0.813 2.391-2.099 2.885-3.631-1.271 0.74-2.677 1.276-4.172 1.579-1.192-1.276-2.896-2.079-4.787-2.079-3.625 0-6.563 2.937-6.563 6.557 0 0.521 0.063 1.021 0.172 1.495-5.453-0.255-10.287-2.875-13.52-6.833-0.568 0.964-0.891 2.084-0.891 3.303 0 2.281 1.161 4.281 2.916 5.457-1.073-0.031-2.083-0.328-2.968-0.817v0.079c0 3.181 2.26 5.833 5.26 6.437-0.547 0.145-1.131 0.229-1.724 0.229-0.421 0-0.823-0.041-1.224-0.115 0.844 2.604 3.26 4.5 6.14 4.557-2.239 1.755-5.077 2.801-8.135 2.801-0.521 0-1.041-0.025-1.563-0.088 2.917 1.86 6.36 2.948 10.079 2.948 12.067 0 18.661-9.995 18.661-18.651 0-0.276 0-0.557-0.021-0.839 1.287-0.917 2.401-2.079 3.281-3.396z">
                                    </path>
                                </svg>
                            </button>
                            <button aria-label="Log in with GitHub" class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="w-5 h-5 fill-current">
                                    <path d="M16 0.396c-8.839 0-16 7.167-16 16 0 7.073 4.584 13.068 10.937 15.183 0.803 0.151 1.093-0.344 1.093-0.772 0-0.38-0.009-1.385-0.015-2.719-4.453 0.964-5.391-2.151-5.391-2.151-0.729-1.844-1.781-2.339-1.781-2.339-1.448-0.989 0.115-0.968 0.115-0.968 1.604 0.109 2.448 1.645 2.448 1.645 1.427 2.448 3.744 1.74 4.661 1.328 0.14-1.031 0.557-1.74 1.011-2.135-3.552-0.401-7.287-1.776-7.287-7.907 0-1.751 0.62-3.177 1.645-4.297-0.177-0.401-0.719-2.031 0.141-4.235 0 0 1.339-0.427 4.4 1.641 1.281-0.355 2.641-0.532 4-0.541 1.36 0.009 2.719 0.187 4 0.541 3.043-2.068 4.381-1.641 4.381-1.641 0.859 2.204 0.317 3.833 0.161 4.235 1.015 1.12 1.635 2.547 1.635 4.297 0 6.145-3.74 7.5-7.296 7.891 0.556 0.479 1.077 1.464 1.077 2.959 0 2.14-0.020 3.864-0.020 4.385 0 0.416 0.28 0.916 1.104 0.755 6.4-2.093 10.979-8.093 10.979-15.156 0-8.833-7.161-16-16-16z">
                                    </path>
                                </svg>
                            </button>
                        </div> -->
                        <div class="text-center mt-2">
                            <p class="signup">
                                Already have an account?
                                <a rel="noopener noreferrer" href="#" class="" data-bs-toggle="modal"
                                   data-bs-target="#loginmodal">Log in</a>
                            </p>
                            <button type="button" class="btn text-light" data-bs-dismiss="modal" aria-label="Close">
                                Close
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        <script>
                    $(document).ready(function () {
                        $("#login-form").submit(function (event) {
                            event.preventDefault();
                            $.ajax({
                                url: "SignInController",
                                type: "POST",
                                data: $(this).serialize(),
                                dataType: "json",
                                success: function (response) {
                                    if (response.status === "SUCCESS") {
                                        $("#error-message").text(response.message);
                                    } else {
                                        $("#error-message").text(response.message);
                                    }
                                },
                                error: function (xhr, status, error) {
                                    console.error("AJAX request failed:", status, error);
                                }
                            });
                        });
                    });
                    $(document).ready(function () {
                        $("#reg-form").submit(function (event) {
                            event.preventDefault();
                            $.ajax({
                                url: "SignUpController",
                                type: "POST",
                                data: $(this).serialize(),
                                dataType: "json",
                                success: function (response) {
                                    if (response.status === "SUCCESS") {
                                        $("#error-message2").text(response.message);
                                    } else {
                                        $("#error-message2").text(response.message);
                                    }
                                },
                                error: function (xhr, status, error) {
                                    console.error("AJAX request failed:", status, error);
                                }
                            });
                        });
                    });
                </script>-->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>

</html>