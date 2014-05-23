<?php

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class UsersDAO
{
    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getUsers(){
        $sql = "SELECT * 
                FROM `rasal_users`";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($users)){
                return $users;
            }
        }
        return array();
    }

    public function getUsersById($id){
        $sql = "SELECT * 
                FROM `rasal_users`
                WHERE id = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':id', $id);
        if($stmt->execute()){
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!empty($user)){
                return $user;
            }
        }
        return array();
    }
}