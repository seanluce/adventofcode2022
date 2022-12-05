$data = Get-Content ./05/input.txt

$originalStacks = @()
$stackArray = @(@(),@(),@(),@(),@(),@(),@(),@(),@())

foreach($row in $data | Where-Object {$_ -like '*`[*'}){
    $originalStacks += $row
}

for($reverseRow = $originalStacks.length; $reverseRow -ge 0; $reverseRow -= 1){
    $column = 0
    for($element = 1; $element -le ($originalStacks[$reverseRow].length-2); $element += 4){
        if($originalStacks[$reverseRow][$element] -ne ' '){
            $stackArray[$column] += $originalStacks[$reverseRow][$element]
        }

        $column += 1

    }
}

foreach($row in $data | Where-Object {$_ -like 'move*'}){
    $qty = $row.split(' ')[1]
    $tempArray = @()
    for($moves = 1; $moves -le $qty; $moves++) {
        $src = $row.split(' ')[3]
        $dst = $row.split(' ')[5]
        $sourceCrateID = $stackArray[$src-1][$stackArray[$src-1].length-1]
        $stackArray[$dst-1] += $sourceCrateID
        $tempArray = @()
        $upperBound = $stackArray[$src-1].length-2
        if($upperBound -ge 0){
            foreach($item in $stackArray[$src-1][0..$upperBound]){
                $tempArray += $item
            }
            $stackArray[$src-1] = $tempArray
        }else{
            $stackArray[$src-1] = @()
        }
        
    }
    
}
Write-Host "Part 1"
foreach($stack in $stackArray){
    $stack[$stack.length-1] -join ''
}

#Begin Part 2

$originalStacks = @()
$stackArray = @(@(),@(),@(),@(),@(),@(),@(),@(),@())

foreach($row in $data | Where-Object {$_ -like '*`[*'}){
    $originalStacks += $row
}

for($reverseRow = $originalStacks.length; $reverseRow -ge 0; $reverseRow -= 1){
    $column = 0
    for($element = 1; $element -le ($originalStacks[$reverseRow].length-2); $element += 4){
        if($originalStacks[$reverseRow][$element] -ne ' '){
            $stackArray[$column] += $originalStacks[$reverseRow][$element]
        }

        $column += 1

    }
}

foreach($row in $data | Where-Object {$_ -like 'move*'}){
    $sourceCrates = @()
    $qty = $row.split(' ')[1]
    $tempArray = @()
    $src = $row.split(' ')[3]
    $dst = $row.split(' ')[5]
        
        $sourceCrates = $stackArray[$src-1][($stackArray[$src-1].length-$qty)..($stackArray[$src-1].length-1)]
        $stackArray[$dst-1] += $sourceCrates
        $tempArray = @()
        $upperBound = $stackArray[$src-1].length-1-$qty
        if($upperBound -ge 0){
            foreach($item in $stackArray[$src-1][0..$upperBound]){
                $tempArray += $item
            }
            $stackArray[$src-1] = $tempArray
        }else{
            $stackArray[$src-1] = @()
        }
        
    
}

Write-Host "Part 2"
foreach($stack in $stackArray){
    $stack[$stack.length-1] -join ''
}