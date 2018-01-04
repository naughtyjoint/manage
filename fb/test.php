<?PHP
session_start();
require_once __DIR__ . '/vendor/autoload.php'; // change path as needed

$access_token = "EAAFtFl39JV4BABAYynDcCbXnKWOXMaEq6vZBCrtJPECQfEoKYDLDGmoGKlhJ6ug03h1rpJVwZBZAZBM8JIjXhs7m54vv0knOouTespZB1vARMuZB3w0ZCREKq2NNsZCsEalKnncCIUcYm8Ycs0OeYgxXI4rqKx4kBOinWWWE55GEvSQLTYVomK2uP8n1HanZCz9lxNGzV5zIFGwZDZD";
$fb = new \Facebook\Facebook([
  'app_id' => '401417810290014',
  'app_secret' => '08ab9f4b3e74440a242015acc1c0b7d7',
  'default_graph_version' => 'v2.10',
  //'default_access_token' => '{access-token}', // optional
]);

// Use one of the helper classes to get a Facebook\Authentication\AccessToken entity.
//   $helper = $fb->getRedirectLoginHelper();
//   $helper = $fb->getJavaScriptHelper();
//   $helper = $fb->getCanvasHelper();
//   $helper = $fb->getPageTabHelper();

//$helper = $fb->getRedirectLoginHelper();

try {
  // Get the \Facebook\GraphNodes\GraphUser object for the current user.
  // If you provided a 'default_access_token', the '{access-token}' is optional.
//  $oAuth2Client = $fb->getOAuth2Client();
//  if(!$access_token->isLongLived())
//    $access_token = $oAuth2Client->getLongLivedAccessToken($access_token);
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
echo 'Name:' . $me->getName() .', ID:' .  $me->getId();
echo 'email:' . $me->getEmail();

$userData = $response->getGraphNode()->asArray();

$_SESSION['User_data'] = $userData;
?>
