<?php 

namespace App\Controller;

use Framework\RenderTemplate;
use App\Model\FormationManager;

class FormationController extends RenderTemplate {

    public function showFormationPage() {
        if(isset($_SESSION['user_id'])) {
            $this->renderTemplate('formations.html');
        } else {
            http_response_code(404);
        }
    }

    public function showFormation() {
        if(isset($_SESSION['user_id'])) {
            $this->renderTemplate('formation_page.html');
        } else {
            http_response_code(404);
        }
    }

    public function getFormations() {
        $formations = new FormationManager();
        $getFormations = $formations->getFormations();

        if(!empty($getFormations)) {
            $result = [
                "status" => 200,
                "results" => [$getFormations]
            ];
            $encoded = json_encode($result);
            echo $encoded;
        } else {
            $result = [
                "status" => 400,
                "results" => []
            ];
            $encoded = json_encode($result);
            echo $encoded;
        }
    }

    public function getFormation($id) {
        $formation = new FormationManager();
        $formation2 = $formation->getFormation($id);

        if(!empty($formation2)) {
            $result = [
                "status" => 200,
                "results" => [$formation2]
            ];
            $encoded = json_encode($result);
            echo $encoded;
        } else {
            $result = [
                "status" => 400,
                "results" => []
            ];
            $encoded = json_encode($result);
            echo $encoded;
        }
    }

}

?>
