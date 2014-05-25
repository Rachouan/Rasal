<?php

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

$salt = 'debestedevoleperszijnwijLOLLLLLLL2424*#@#';

class UsersDAO
{
    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function insertUser($email, $password, $naam, $voornaam, $profilePic){
        $sql = "INSERT INTO `rasal_users`(`email`, `password`, `naam`, `voornaam`, `profilePic`) 
                VALUES (:email, :password, :naam, :voornaam, :profilePic);";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":email",$email);
        $stmt->bindValue(":password", sha1($salt + $password));
        $stmt->bindValue(":naam",$naam);
        $stmt->bindValue(":voornaam",$voornaam);
        $stmt->bindValue(":profilePic",$profilePic);
        if($stmt->execute()){
            return $this->getUsersById($this->pdo->lastInsertId());
        }
        return false;
    }

    public function getUserByEmailAndPassword($email, $password){
        $sql = "SELECT * FROM `rasal_users` 
                WHERE `email` = :email 
                AND `password` = :password";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':email', $email);
        //$stmt->bindValue(':password', sha1($salt + $password));
        $stmt->bindValue(':password', $password);
        if($stmt->execute()){
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!empty($user)){
                return $user;
            }
        }
        return array();
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

    public function getUserById($id){
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