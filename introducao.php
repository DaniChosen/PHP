<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
</head>
<body>

    <h1> Meu primeiro primeiro programa com PHP!</h1>

    <?php 
      echo "Olá Mundo! ";
      $nome = "Jubileu ";
      $idade = 50;

      if($idade > 18){
        echo " $nome Maior de 18 anos, com $idade anos ";
      }else{
        echo " $nome Menor de 18 anos, com $idade anos ";
    
      }
      for($num = 1; $num <= 5; $num++){
        echo("<br>Contagem: $num");
      }
      $contador = 1;
      while($contador <=5){
        echo "<br> Contagem2: $contador";
        $contador++;
      }

      function saudacao($nome){
        echo "<br>  Olá, $nome";
      }
      saudacao("Julio");

      $cores = array("Vermelho", "amarelo", "azul");
      echo "<br> sem for: $cores[0]";
      echo "<br> sem for: $cores[1]";
      echo "<br> sem for: $cores[2]";

      for($n = 0; $n < count($cores); $n++){
        echo "<br> com for: $cores[$n]";
        
      }

       
      





    ?>














</body>
</html>