<?php 

session_start();

require_once(__DIR__.'/../vendor/autoload.php');

use App\Controller\UserController;
$router = new \Bramus\Router\Router();
$router->setNamespace('\App\Controller');

$router->get('/homepage', 'HomepageController@showHomepage');
$router->post('/homepage', 'HomepageController@showHomepage');
$router->get('/confidentiality', 'ConfidentialityController@showConfidentiality');
$router->get('/polls', 'PollController@showPolls');
$router->get('/api/polls', 'PollController@getPoll');
$router->post('/api/login', 'UserController@loginUser');
$router->get('/api/poll/questions/{poll_id}','PollController@getPollQuestionsAndAnswers');
$router->get('/poll/{id}', 'PollController@showPollPage');
$router->post('/api/poll/complete' , 'PollController@giveAnswerToUser');
$router->get('/formations', 'FormationController@showFormationPage');
$router->get('/statistique', 'StatistiqueController@showStatPage');
$router->get('/login', 'UserController@showLoginPage');
$router->post('/login', 'UserController@showLoginPage');
$router->get('/api/formations', 'FormationController@getFormations');
$router->get('/api/formation/{id}', 'FormationController@getFormation');
$router->get('/formation/{id}', 'FormationController@showFormation');
$router->get('/', 'LandingController@showLanding');

$router->run();

?>