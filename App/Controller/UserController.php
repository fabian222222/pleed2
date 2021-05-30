<?php 

namespace App\Controller;

use Framework\RenderTemplate;
use App\Model\UserManager;

class UserController extends RenderTemplate {

    public function loginUser(){

        if(isset($_POST['mail']) && isset($_POST['password'])) {

            $mail = htmlspecialchars($_POST['mail']);
            $password = htmlspecialchars($_POST['password']);

            $login = new UserManager();
            $userInfo = $login->getUser($mail);

            $result = [
                "status" => 200,
                "results" => [$userInfo]
            ];

            $encoded = json_encode($result);

            echo $encoded;

        }
    }

    public function showLoginPage() {
        if(isset($_POST['mail']) && isset($_POST['password'])){

            $mail = htmlspecialchars($_POST['mail']);
            $password = htmlspecialchars($_POST['password']);

            $login = new UserManager();
            $userInfo = $login->getUser($mail);

            $unknown = "Email ou mot de passe incorrect";

            if($userInfo) {

                if($userInfo["password"] == $password) {

                    $_SESSION['user_id'] = $userInfo['id'];
                    $_SESSION['function'] = $userInfo['function_id'];

                    header("Location: http://pleed.local/homepage"); 

                } else {

                    return $this->renderTemplate('connect.html', [
                        "error" => $unknown
                    ]);

                }

            } else{
                return $this->renderTemplate('connect.html', [
                    "error" => $unknown
                ]);
            }

        } else {
            return $this->renderTemplate('connect.html');
        }
    }

}

?>