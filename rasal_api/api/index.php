<?php

define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);

require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'MessagesDAO.php';
require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'UsersDAO.php';

require_once WWW_ROOT. "api" .DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR .'Slim.php';

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$messagesDAO = new MessagesDAO();
$usersDAO = new UsersDAO();

$app->post("/insertMessage/?", function() use ($app, $messagesDAO){

	header("Content-Type:application/json");
	$post = $app->request->post();
	if(empty($post)){
		$post = (array) json_decode($app->request()->getBody());
	}
	echo json_encode($messagesDAO->insertMessage($post["user_id"], $post["compagnion_id"], $post["message"]));
	exit();

});

$app->get("/users/?", function($email, $password) use ($usersDAO){

	header("Content-Type:application/json");
	echo json_encode($usersDAO->getUserByEmailAndPassword($email, $password));
	exit();

});

$app->get("/messages/?", function() use ($messagesDAO){

	header("Content-Type:application/json");
	echo json_encode($messagesDAO->getMessages());
	exit();

});


$app->get("/messages/:user_id/?", function($user_id) use ($messagesDAO){

	header("Content-Type:application/json");
	echo json_encode($messagesDAO->getMessagesByUser_Id($user_id));
	exit();
	
});

$app->get("/users/?", function() use ($usersDAO){

	header("Content-Type:application/json");
	echo json_encode($usersDAO->getUsers());
	exit();

});

$app->get("/users/:user_id/?", function($email, $password) use ($usersDAO){

	header("Content-Type:application/json");
	//echo json_encode($usersDAO->getUserById($id));
	echo json_encode($usersDAO->getUserByEmailAndPassword($email, $password));
	exit();
	
});

$app->run();