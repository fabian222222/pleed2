<?php 

namespace App\Model;

use PDO;
use Framework\BaseSet;

class UserManager extends BaseSet {

    public function getUser($mail) {
        $db = $this->getDb();
        $stmt = $db->prepare('SELECT * FROM `user` WHERE email = :email');
        $stmt->execute([
            "email" => $mail
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

}

?>