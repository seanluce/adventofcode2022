$data = Get-Content ./06/input.txt

$dataArray = $data.ToCharArray()

$buffer = @('','','','')

$count = 0

for($count = 0; $count -le $dataArray.Length-1; $count++){
    Write-Host "Current bit:" + $dataArray[$count] + "Count: " + $count
    if($count -ge 4){
        $buffer[3] = $dataArray[$count]
        $buffer[2] = $dataArray[$count-1]
        $buffer[1] = $dataArray[$count-2]
        $buffer[0] = $dataArray[$count-3]
    }
    $uniqueCount = $buffer | Sort-Object -Unique
    if($uniqueCount.Length -eq 4){
        Write-Host $uniqueCount ($count + 1)
        break
    }
}

# Part 2

$buffer = @('','','','','','','','','','','','','','')

$count = 0

for($count = 0; $count -le $dataArray.Length-1; $count++){
    Write-Host "Current bit:" + $dataArray[$count] + "Count: " + $count
    if($count -ge 14){
        $buffer[13] = $dataArray[$count]
        $buffer[12] = $dataArray[$count-1]
        $buffer[11] = $dataArray[$count-2]
        $buffer[10] = $dataArray[$count-3]
        $buffer[9] = $dataArray[$count-4]
        $buffer[8] = $dataArray[$count-5]
        $buffer[7] = $dataArray[$count-6]
        $buffer[6] = $dataArray[$count-7]
        $buffer[5] = $dataArray[$count-8]
        $buffer[4] = $dataArray[$count-9]
        $buffer[3] = $dataArray[$count-10]
        $buffer[2] = $dataArray[$count-11]
        $buffer[1] = $dataArray[$count-12]
        $buffer[0] = $dataArray[$count-13]
    }
    $uniqueCount = $buffer | Sort-Object -Unique
    if($uniqueCount.Length -eq 14){
        Write-Host $uniqueCount ($count + 1)
        break
    }
}
