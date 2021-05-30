<?php 

namespace App\Controller;

use Framework\RenderTemplate;

class HomepageController extends RenderTemplate {

    public function showHomepage() {
        if(isset($_SESSION['user_id'])) {
            $this->renderTemplate('home.html');
        } else {
            http_response_code(404);
        }
    }
}

?>