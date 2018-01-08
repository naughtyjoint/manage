<?PHP
session_start();
include "_database.class.php";
require_once __DIR__ . '/vendor/autoload.php'; // change path as needed
unset($_SESSION['memberData']);

//判斷是否登入
if(isset($_SESSION["memberData"]) && ($_SESSION["memberData"]!="")){
    $result_already =array(
        'success' => 'true',
        'result' => '',
        'message' => "Logined already"
    );
    $result_already['result'] = $_SESSION['memberData'];
    echo json_encode($result_already);
}else{

    $access_token = "EAAFtFl39JV4BAIANAZB4sOVlclYUZBZAqViYjo49ZCgZAN1CsPUUZBAaYrwCfpj1PmTj5G7Szu8lwXBfu2eQBuAqXgOsMi0BjahOInzBmF5ZBGYFq71ZAuGsv4gdig1Jm6JBPDkUPj7RmPcm47z2urWJnZAByRqhdlk2lNpJEwjaOReNTYZBzsZBkfZB5su6gBduAbpWNgdv1YZBG3wZDZD";
//$access_token = $_POST["accesstoken"];
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
    $userData = $response->getGraphNode()->asArray(); //$userData["id"]為FB的ID


    $result_re =array(
        'success' => 'true',
        'result' => '',
        'message' => "Registered successfully"
    );

    $result_lo =array(
        'success' => 'true',
        'result' => '',
        'message' => "Login successfully"
    );


    $db = Database::DB();
    $queryId = "SELECT COUNT(member_id) FROM member WHERE member_id=:member_id";
    $idCount = $db->query_prepare_first($queryId,array(':member_id' => $userData['id']));

    if($idCount['COUNT(member_id)']==0){
        $table = "member";
        $memberData = array(
            'member_id' => $userData['id'],
            'member_name' => $userData['name'],
            'platform_id' => '4',
            'email' => $userData['email']

        );

        $db->query_insert($table,$memberData);
        $db->close();

        $result_re["result"]=$memberData;

        echo json_encode($result_re);
    }else{
        $memberData = $db->query_prepare_first("SELECT member_id,member_name,platform_id, point FROM member WHERE member_id=:member_id",array(':member_id' => $userData['id']));
        $result_lo["result"]=$memberData;
        echo json_encode($result_lo);
        $_SESSION['memberData'] = $memberData;
        $db->close();
    }
}




?>
