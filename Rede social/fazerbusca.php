<?php
    session_start();

    // Se tem alguma busca digitada
    if(isset($_GET["busca"])) {
        
        // Armazena na variável conteúdo o valor de input.
        $conteudo = $_GET["busca"];
        
        // Se tiver pos
        if(isset($_SESSION["postagens"])) {
            echo "<ul>";
            foreach($_SESSION["postagens"] as $postagem) {
                if(stripos($postagem, $conteudo) !== false) {
                    echo "<li> $postagem </li>";
                }
            }
            echo "</ul>";
        }

    }