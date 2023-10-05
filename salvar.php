<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processando Postagem</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>

    <div class="painel">
        <div class="cabecalho">
            <h1> Senac Connect </h1>
        </div>

        <div class="conteudo">
            <h2> Postagem efetuada com sucesso! </h2>

            <?php
            $usuario = "Aurora";

            setcookie("nome", $usuario, time() + 86400 * 30, "/");

             if($_SERVER["REQUEST_METHOD"] == "POST"){

                $postagem = $_POST["postagem"];
                echo "voce postou: $postagem";


                session_start();

                if(!isset($_SESSION["postagens"])){

                    $_SESSION["postagens"] = array();
                }
                array_push($_SESSION["postagens"], $postagem);
             }

            ?>
            
        </div>

        <div class="rodape">
          <a href="index.html" class="botao">Fazer Nova Postagem </a>  
          <a href="cookie.html" class="botao"> Cadastrar Usuario </a>
          <a href="busca.html" class="botao"> Buscar </a>
          <a href="lista.php" class="botao"> Lista de posts </a>
        </div>

    
</body>
</html>