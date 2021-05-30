<?php 

namespace App\Model;

use PDO;
use Framework\BaseSet;

class PollManager extends BaseSet {

    public function getPolls() {
        $db = $this->getDb();
        $stmt = $db->prepare('SELECT * FROM poll_undone INNER JOIN poll ON poll_undone.poll_id = poll.id INNER JOIN category ON poll.category_id = category.id');
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPollQuestion($poll_id) {

        $db = $this->getDb();
        $stmt = $db->prepare('SELECT * FROM question WHERE poll_id = :poll_id');
        $stmt->execute([
            "poll_id" => $poll_id
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    }

    public function getPollQuestionAnswer($question_id) {

        $db = $this->getDb();
        $stmt = $db->prepare('SELECT * FROM answer WHERE question_id = :question_id');
        $stmt->execute([
            "question_id" => $question_id
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    }

    public function giveAnswerToUser($user_id, $answer_id) {

        $db = $this->getDb();
        $stmt = $db->prepare('INSERT INTO `user_has_answer`(`user_id`, `answer_id`) VALUES (:user_id, :answer_id)');
        $stmt->execute([
            "user_id" => $user_id,
            "answer_id" => $answer_id,
        ]);

    }

}

?>