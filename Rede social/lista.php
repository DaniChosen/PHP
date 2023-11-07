<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Postagens</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>
    <div class="painel">
        <div class="cabecalho"> 
            <h1> Lista de Posts </h1>
            <a href="index.html" class="botao">Fazer Nova Postagem </a>  
        </div>

        <div class="conteudo">

        <?php
        $usuario = $_COOKIE["nome"];
        echo "Bem-Vindo $usuario!";

        session_start();

        if(isset( $_SESSION["postagens"])){


            foreach ($_SESSION["postagens"] as $postagem){
                echo '<div class="card">';
                echo "<strong> $usuario: </strong>";
                echo "$postagem";
                echo '</div>';
            }

        }else{
            echo "<p> Nenhuma postagem encotrada! </p>";
        }



        
        ?>
             
        </div>

        <div class="rodape"> </div>

        

    </div>
    
</body>
</html>