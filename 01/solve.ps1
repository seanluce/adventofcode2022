$data = Get-Content ./01/input.txt

$elfArray = @()
$elfTotal = 0
$mostCalories = 0

foreach($row in $data){
    if($row -ne ''){
        $elfTotal += $row
    } else {
        $elfArray += $elfTotal
        $elfTotal = 0
    }
}

$elfArray = $elfArray | Sort-Object

$topThreeTotal = $elfArray[$elfArray.Length-1] + $elfArray[$elfArray.Length-2] + $elfArray[$elfArray.Length-3]

$elfArray[$elfArray.Length-1]
$topThreeTotal