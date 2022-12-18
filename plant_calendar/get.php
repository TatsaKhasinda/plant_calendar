<?php
    include 'conn.php';

    $queryResult = $connect->query("SELECT * FROM plant_data");
    $result = array();
    while($fetchData = $queryResult->fetch_assoc()){
        $result[] = $fetchData;
    }
    echo json_encode($result);
?>