<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Authentification</title>
  <!-- Favicon -->
  <asset:link rel="icon" href="icone.ico" type="image/x-ico" />
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <asset:stylesheet src="vendor/nucleo/css/nucleo.css"/>
  <asset:stylesheet src="vendor/@fortawesome/fontawesome-free/css/all.min.css"/>
  <!-- Argon CSS -->
  <asset:stylesheet src="template/argon.css"/>
</head>

<body class="bg-default">
  <!-- Main content -->
  <div class="main-content">
    <!-- Header -->
    <div class="header bg-gradient-primary p6-7 py-lg-8 pt-lg-4">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white">Bienvenue!</h1>
              <p class="text-lead text-white">Interface d'administration de LeCoinCoin</p>
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>Connectez-vous avec vos identifiants</small>
              </div>
              <g:if test='${flash.message}'>
                <div class="text-danger mb-4 text-center" role="alert">${flash.message}</div>
            </g:if>
              <form role="form" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control" placeholder="Email" type="Nom d'utilisateur" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Mot de passe" type="password" name="${passwordParameter ?: 'password'}" id="password">
                  </div>
                </div>
                <div class="custom-control custom-control-alternative custom-checkbox">
                  <input class="custom-control-input" id=" customCheckLogin" type="checkbox">
                  <label class="custom-control-label" for=" customCheckLogin">
                    <span class="text-muted">Se souvenir de moi</span>
                  </label>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary my-4">Connexion</button>
                </div>
              </form>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-6">
              <a href="#" class="text-light"><small>Mot de passe oublié ?</small></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Argon Scripts -->
  <!-- Core -->
  <asset:javascript src="vendor/jquery/dist/jquery.min.js"/>
  <asset:javascript src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"/>
  <asset:javascript src="vendor/js-cookie/js.cookie.js"/>
  <asset:javascript src="vendor/jquery.scrollbar/jquery.scrollbar.min.js"/>
  <asset:javascript src="vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"/>
  <!-- Argon JS -->
  <asset:javascript src="template/js/argon.js"/>
</body>

</html>