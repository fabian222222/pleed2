<?php 

namespace App\Controller;

use Framework\RenderTemplate;

class LandingController extends RenderTemplate {

    public function showLanding() {
        $this->renderTemplate('landing.html');
    }

}

?>