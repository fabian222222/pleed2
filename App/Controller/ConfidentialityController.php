<?php 

namespace App\Controller;

use Framework\RenderTemplate;

class ConfidentialityController extends RenderTemplate {

    public function showConfidentiality() {
        if(isset($_SESSION['user_id'])) {
            $this->renderTemplate('confidentiality.html');
        } else {
            http_response_code(404);
        }
    }
}

?>