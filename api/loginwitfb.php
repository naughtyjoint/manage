<?php
require_once __DIR__ . '/vendor/autoload.php'; // change path as needed

$access_token = "EAAFtFl39JV4BAHeVIfaZAej9H4ZCkBw1zELnlbaDKxEzojueYNdwZCGvXw6SYPfkMSV7LWMRCxWC6zfUfl2ZBHWCjms5pAu8Gp2YmiUmmxqz8ZB1QZAER5yMrs7dV1bOxWV4DGYYJ5Ohnis0N36t8oAvkc0gkj4RH35ujeZC6esmyZAv6Vm1BkO3g6gZCNDvgRnVKy9sR2R5rswZDZD";
//$access_token = $_POST["fb_token"];
$fb = new \Facebook\Facebook([
    'app_id' => '401417810290014',
    'app_secret' => '08ab9f4b3e74440a242015acc1c0b7d7',
    'default_graph_version' => 'v2.10',
]);


try {
    // Get the \Facebook\GraphNodes\GraphUser object for the current user.
    // If you provided a 'default_access_token', the '{access-token}' is optional.
    $response = $fb->get('/me?fields=email', $access_token);
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
$FB_Name = $me->getName();
$FB_ID = $me->getId();
$FB_email = $me->getEmail();

?>
