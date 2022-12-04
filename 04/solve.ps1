$data = Get-Content ./04/input.txt

$output = 0

foreach($row in $data){
    $firstInSecond = $false
    $secondInFirst = $false
    $firstSet = @()
    $secondSet = @()
    $firstPair = ($row.split(',')[0].split('-'))
    $secondPair = ($row.split(',')[1].split('-'))
    for($i = [int]$firstPair[0]; $i -le [int]$firstPair[1]; $i++){
        $firstSet += $i
    }
    for($j = [int]$secondPair[0]; $j -le [int]$secondPair[1]; $j++){
        $secondSet += $j
    }
    foreach($element in $firstSet){
        if($element -in $secondSet){
            $firstInSecond = $true
        }else{
            $firstInSecond = $false
            foreach($element in $secondSet){
                if($element -in $firstSet){
                    $secondInFirst = $true
                }else{
                    $secondInFirst = $false
                    break
                }
            }
            break
        }
    }
    if($firstInSecond -eq $true){
        Write-Host "First set is fully contained in second set."
        $output += 1
    }
    if($secondInFirst -eq $true){
        Write-Host "Second set is fully contained in first set."
        $output += 1
    }
}

$output

$output = 0

foreach($row in $data){
    $firstInSecond = $false
    $secondInFirst = $false
    $firstSet = @()
    $secondSet = @()
    $firstPair = ($row.split(',')[0].split('-'))
    $secondPair = ($row.split(',')[1].split('-'))
    for($i = [int]$firstPair[0]; $i -le [int]$firstPair[1]; $i++){
        $firstSet += $i
    }
    for($j = [int]$secondPair[0]; $j -le [int]$secondPair[1]; $j++){
        $secondSet += $j
    }
    if($firstSet | Where-Object{$secondSet -contains $_}){
        $output += 1
    }
}

$output
