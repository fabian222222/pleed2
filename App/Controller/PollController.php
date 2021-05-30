<?php 

namespace App\Controller;

use Framework\RenderTemplate;
use App\Model\PollManager;

class PollController extends RenderTemplate {

    public function showPolls() {
        if(isset($_SESSION['user_id'])) {
            $this->renderTemplate('polls.html');
        } else {
            http_response_code(404);
        }
    }

    public function getPoll() {
        $polls = new PollManager();
        $getPolls = $polls->getPolls();

        if(!empty($getPolls)) {
            $result = [
                "status" => 200,
                "results" => [$getPolls]
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

    public function getPollQuestionsAndAnswers($poll_id) {

        $question_and_answers = [];

        $polls = new PollManager();
        $getPollQuestions = $polls->getPollQuestion($poll_id);

        foreach($getPollQuestions as $key => $question) {
            $getQuestionsAnswers = $polls->getPollQuestionAnswer($question['id']);
            array_push($question_and_answers, [$getPollQuestions[$key], $getQuestionsAnswers]);
        }

        if(!empty($getPollQuestions)) {
            $result = [
                "status" => 200,
                "results" => [$question_and_answers]
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

    public function showPollPage() {
        if(isset($_SESSION['user_id'])) {
            $this->renderTemplate('poll.html');
        } else {
            http_response_code(404);
        }
    }

    public function giveAnswerToUser() {
        $poll = new PollManager();
        $poll->giveAnswerToUser($_POST['user_id'], $_POST['answer_id']);
    }

}

?>