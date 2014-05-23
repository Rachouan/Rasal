<?php

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class MessagesDAO
{
    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getMessages(){
        $sql = "SELECT * 
                FROM `rasal_messages`";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($messages)){
                return $messages;
            }
        }
        return array();
    }

    public function getMessagesByUser_Id($user_id){
        $sql = "SELECT * 
                FROM `rasal_messages`
                WHERE user_id = :user_id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':user_id', $user_id);
        if($stmt->execute()){
            $message = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!empty($message)){
                return $message;
            }
        }
        return array();
    }
}