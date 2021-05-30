<?php 

    namespace Framework;

    use Twig\Loeader\FilessystemLoader;
    use Twig\Environment;

    class RenderTemplate{

        private $templating;

        public function __construct(){

            $loader = new \Twig\Loader\FilesystemLoader('../App/view');
            $twig = new \Twig\Environment($loader);
            $this->templating = $twig;

        }
        
        protected function renderTemplate(string $templateName, array $templateParameters = [])
        {
            echo $this->templating->render($templateName, $templateParameters);
        }

    }

?>