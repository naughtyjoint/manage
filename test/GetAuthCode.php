<?php
include 'database.php';
$FacServiceId = "luckyCL";  //廠商服務代碼
$FacTradeSeq = uniqid('MC');   //廠商交易序號(自動產生)
$TradeType = "2";   //交易模式
$ServerId = null;     //伺服器代號
$CustomerId = null;     //會員代號
$PaymentType = null;  //付費方式/付費方式群組代碼
$ItemCode = null;     //品項代碼
$ProductName = "GS5a3cbb0d6b2e2"; //產品名稱
$Amount = null;   //金額
$Currency = null;  //幣別
$SandBoxMode = "true";  //測試環境
$FacKey = "B8sqJqY3QFQg8wE2LZ4AxcWQ69v3RUyy";   //廠商key
$Hash = "";     //驗證碼
$Createdate = date('Y-m-d H:i:s',time());


if(isset($_GET["CustomerId"])&&isset($_GET["Amount"])&&isset($_GET["Currency"])){
    $CustomerId = $_GET["CustomerId"];
    $Amount = $_GET["Amount"];
    $Currency = $_GET["Currency"];
    $Encodedata = substr(urlencode($ProductName),strpos(urlencode($ProductName),"%"));
    $data = $FacServiceId.$FacTradeSeq.$TradeType.$ServerId.$CustomerId.$PaymentType.$ItemCode.$Encodedata.$Amount.$Currency.$SandBoxMode.$FacKey;


//echo "<br>";
    $Hash = hash('sha256', $data);
    $geturl = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/AuthGlobal?FacTradeSeq=".$FacTradeSeq."&ServerId=".$ServerId."&CustomerId=".$CustomerId."&PaymentType=".$PaymentType."&ItemCode=".$ItemCode."&ProductName=".$ProductName."&Amount=".$Amount."&Currency=".$Currency."&SandBoxMode=".$SandBoxMode."&Hash=".$Hash.'"';
//echo $Hash;



    $datatosent = array('FacServiceId'=>$FacServiceId,'FacTradeSeq'=>$FacTradeSeq,'TradeType'=>$TradeType,'ServerId'=>$ServerId,'CustomerId'=>$CustomerId,'PaymentType'=>$PaymentType,'ItemCode'=>$ItemCode,'ProductName'=>$ProductName,'Amount'=>$Amount,'Currency'=>$Currency,'SandBoxMode'=>$SandBoxMode,'Hash'=>$Hash);
    $url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/AuthGlobal";
    $ch = curl_init();


    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($datatosent));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

    $output = curl_exec($ch);
    curl_close($ch);


    $opt=json_decode($output);
    $AuthCode = $opt->AuthCode;
    $ReturnCode = 0;
    $AuthUrl = "https://test.mycard520.com.tw/MyCardPay?AuthCode=".$AuthCode;



    $query = "INSERT INTO mycard SET FacTradeSeq=:FacTradeSeq , ServerId=:ServerId, member_id=:member_id, PaymentType=:PaymentType, ItemCode=:ItemCode, product_id=:product_id, Amount=:Amount, Currency=:Currency, Created_date=:Created_date, AuthCode=:AuthCode, ReturnCode=:ReturnCode";

    $stmt = $con->prepare($query);

    $stmt->bindParam(':FacTradeSeq', $FacTradeSeq);
    $stmt->bindParam(':ServerId', $ServerId);
    $stmt->bindParam(':member_id',$CustomerId);
    $stmt->bindParam(':PaymentType',$PaymentType);
    $stmt->bindParam(':ItemCode',$ItemCode);
    $stmt->bindParam(':product_id',$ProductName);
    $stmt->bindParam(':Amount',$Amount);
    $stmt->bindParam(':Currency',$Currency);
    $stmt->bindParam(':Created_date',$Createdate);
    $stmt->bindParam(':AuthCode',$AuthCode);
    $stmt->bindParam(':ReturnCode',$ReturnCode);

    $stmt->execute();


    header("Location: ".$AuthUrl);
}


?>

<html>
<head>
    <title>mycard交易測試</title>
</head>
<body>
    <form method="GET" action="">
        會員代號<input type="text" name="CustomerId"><br>
        <select id="money" name="Amount" class="form-control">
            <option value="">請選擇</option>
            <option value="50">50元兌換5000爽幣</option>
            <option value="150">150元兌換15000爽幣</option>
            <option value="300">300元兌換30000爽幣</option>
            <option value="350">350元兌換35000爽幣</option>
            <option value="400">400元兌換40000爽幣</option>
            <option value="450">450元兌換45000爽幣</option>
            <option value="500">500元兌換50000爽幣</option>
            <option value="1000">1000元兌換100000爽幣</option>
            <option value="1150">1150元兌換115000爽幣</option>
            <option value="2000">2000元兌換200000爽幣</option>
            <option value="3000">3000元兌換300000爽幣</option>
            <option value="5000">5000元兌換500000爽幣</option>
            <option value="10000">10000元兌換1000000爽幣</option>
        </select>
        <select name="Currency">
            <option>TWD</option>
            <option>HKD</option>
            <option>USD</option>
        </select><br>
        <input type="submit" value="送出">
    </form>


</body>
</html>



