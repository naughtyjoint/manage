<?php

class CoderFbHelp
{

    private $fb_userdata;
    private $fb_name;
    private $fb_id;
    private $fb_email;

    public function __construct($access_token)
    {

        $fb = new \Facebook\Facebook([
            'app_id' => '401417810290014',
            'app_secret' => '08ab9f4b3e74440a242015acc1c0b7d7',
            'default_graph_version' => 'v2.10',
            //'default_access_token' => '{access-token}', // optional
        ]);



        try {
            // Get the \Facebook\GraphNodes\GraphUser object for the current user.
            // If you provided a 'default_access_token', the '{access-token}' is optional.
            $response = $fb->get('/me?fields=email,name', $access_token);
        } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
        } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
        }

        $me = $response->getGraphUser();
        $this->fb_userdata = $response->getGraphNode()->asArray(); //$userData["id"]為FB的ID
        $this->fb_name = $me->getFirstName().$me->getLastName();
        $this->fb_id = $me->getId();
        $this->fb_email = $me->getEmail();

    }

    public function getUserArray(){
        return $this->fb_userdata;
    }

    public function getUserId(){
        return $this->fb_id;
    }

    public function getUserName(){
        return $this->fb_name;
    }

    public function getUserEmail(){
        return $this->fb_email;
    }

}