<?php
//fazer conexao do backend com o banco de dados
$nomeServidor = "sql301.infinityfree.com"; //localhost
$username ="if0_35249685";// root
$senha ="qS5NJpXARIn";//""
$nomeBanco = "if0_35249685_rede_banco";//rede_banco

//mysqli - driver responsavel por conectar com o banco 
$conexao = new mysqli($nomeServidor, $username, $senha, $nomeBanco);

//se a conexao falhar - die encerra execucao e apresenta mensagem
if($conexao -> connect_error){
    die("Conexao com o banco de dados falhou!". $conexao -> connect_error);
}

?>