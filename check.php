<?php
/*

    nam.com/Cheack.php?uuid=00008030-001655623C9A802E&model=iPhone12,5&Bundleid=co.xxxx.app&NameID=PubgSQ&Lang=English&code=9Z29OOZ59BDG283G5M2


error_reporting(0);
$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
if (strcasecmp($REQUEST_METHOD, "GET") == 0) {
    header($_SERVER["SERVER_PROTOCOL"] . "Error method", true, 405);
    exit;
}
 */
require_once "include/config.php";
$code = $_GET['code'];
$uuid = $_GET['uuid'];
if ($uuid && $code) {
    function TimePackage($String)
    {
        if ($String == "1d") {
            return date("Y/m/d H:i:s", strtotime("+1 day"));
        }
        if ($String == "7d") {
            return date("Y/m/d H:i:s", strtotime("+7 day"));
        }
        if ($String == "1m") {
            return date("Y/m/d H:i:s", strtotime("+30 day"));
        }
        if ($String == "3m") {
            return date("Y/m/d H:i:s", strtotime("+90 day"));
        }
        if ($String == "6m") {
            return date("Y/m/d H:i:s", strtotime("+182 day"));
        }
        if ($String == "1y") {
            return date("Y/m/d H:i:s", strtotime("+365 day"));
        }
        return "Unkonw";
    }
    $sql = "SELECT * FROM `codes`  WHERE  `code` = '" . $code . "' ";
    $result = mysqli_query($db, $sql);
    if (0 < mysqli_num_rows($result)) {
        while ($row = mysqli_fetch_assoc($result)) {
            $uuid__ = $row["uuid"];
            $id__ = $row["id"];
            $TimeCode = $row["code_time"];
            if ($uuid__ == "") {
                $code_exp = TimePackage($TimeCode);
                $code_use = date("Y/m/d H:i:s");
                $sql = "UPDATE codes SET  uuid='" . $uuid . "',  code_exp='" . $code_exp . "', status='Activated', code_use='" . $code_use . "' WHERE id=" . $id__;
                if ($db->query($sql) === true) {
                    $myObj->Checked_0x = "Yes";
                    $myObj->Finished_Time = $code_exp;
                    $myJSON = json_encode($myObj);
                    echo $myJSON;
                } else {
                    $myObj->Checked_0x = "ERROR";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;
                }
            } else {
                $sql = "SELECT * FROM `codes`  WHERE  `uuid` = '" . $uuid . "' AND  `code` = '" . $code . "'";
                $sql2 = "UPDATE codes SET  status='expired' WHERE id=" . $id__;

                $result = mysqli_query($db, $sql);
                $result = mysqli_query($db, $sql2);

                if (0 < mysqli_num_rows($result)) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $NSTimeNow = date("Y/m/d H:i:s");
                        $ExpDate = strtotime($row["code_exp"]);
                        $nowD = strtotime($NSTimeNow);
                        if ($nowD < $ExpDate) {
                            $active = 1;
                        } else {
                            $active = 0;
                        }
                        if ($active == 1) {
                            $myObj->Finished_Time = $row["code_exp"];
                            $myObj->Checked_0x = "Yes";
                            $myJSON = json_encode($myObj);
                            echo $myJSON;
                        } else {
                            if ($active == 0) {
                                $myObj->Checked_0x = "NO";
                                $myObj->time_Finished = $row["code_exp"];
                                $myJSON = json_encode($myObj);
                                echo $myJSON;
                            }
                        }
                    }
                } else {
                    $myObj->Checked_0x = "ERROR__";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;
                }
            }
        }
    } else {
        $myObj->Checked_0x = "Not_Found_Code";
        $myJSON = json_encode($myObj);
        echo $myJSON;
    }
} else {
    $myObj->Checked_0x = "ERROR_ON_POST";
    $myJSON = json_encode($myObj);
    echo $myJSON;
}

?>
