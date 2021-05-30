<?php 

namespace App\Controller;

use Framework\RenderTemplate;

class StatistiqueController extends RenderTemplate {

    public function showStatPage(){

        if(isset($_SESSION['user_id'])) {
            return $this->renderTemplate('statistique.html');
        } else {
            http_response_code(404);
        }

    }

}

?>