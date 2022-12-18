<?php
    $connect = new mysqli("localhost", "root", "1234", "plant_calendar");
    if ($connect){
        
    }else {
        echo "Connection Failed";
        exit();
    }
?>