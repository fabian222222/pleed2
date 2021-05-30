<?php 

namespace App\Model;

use PDO;
use Framework\BaseSet;

class FormationManager extends BaseSet {

    public function getFormations() {
        $db = $this->getDb();
        $stmt = $db->prepare('SELECT * FROM lesson_undone INNER JOIN lesson ON lesson_undone.lesson_id = lesson.id INNER JOIN category ON lesson.category_id = category.id');
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getFormation($formation_id) {

        $db = $this->getDb();
        $stmt = $db->prepare('SELECT * FROM lesson WHERE id = :id');
        $stmt->execute([
            "id" => $formation_id
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    }


}

?>