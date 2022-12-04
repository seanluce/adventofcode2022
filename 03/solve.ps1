$data = Get-Content ./03/input.txt

$output = 0

$count = 1
$valueMap = @{}

$lower = 97..122 | ForEach-Object{[char]$_}
$upper = 65..90 | ForEach-Object{[char]$_}

foreach($letter in ($lower + $upper)){
    $valueMap[$letter] = $count
    $count++
}

foreach($row in $data){
    $duplicateFound = $false
    $firstHalf = $row[0..($row.Length/2-1)]
    $secondHalf = $row[($row.Length/2)..($row.Length-1)]
    foreach($item in $firstHalf){
        if($secondHalf -ccontains $item){
            $duplicate = $item
            $duplicateFound = $true
            break
        }
    }
    if($duplicateFound -eq $false){
        foreach($item in $secondHalf){
            if($firstHalf -ccontains $item){
                $duplicate = $item
                break
            }
        }
    }
    foreach($letter in ($firstHalf + $secondHalf)){
        if($letter -ceq $duplicate){
            Write-Host $letter -NoNewLine -ForegroundColor Red
        }else{
            Write-Host $letter -NoNewLine
        }
    }
    Write-Host ' ' $valueMap[$duplicate]
    $output += $valueMap[$duplicate]
}

$output

$output = 0


for($i = 0; $i -le $data.length - 3; $i+=3){
    $elfOne = $data[$i].ToCharArray()
    $elfTwo = $data[$i+1].ToCharArray()
    $elfThree = $data[$i+2].ToCharArray()
    $badge = $elfOne | Where-Object {$_ -cin $elfTwo} | Where-Object {$_ -cin $elfThree}
    $output += $valueMap[$badge[0]]
    foreach($letter in $elfOne){
        if($letter -ceq $badge[0]){
            Write-Host $letter -NoNewLine -ForegroundColor Red
        }else{
            Write-Host $letter -NoNewLine
        }
    }
    Write-Host ''
    foreach($letter in $elfTwo){
        if($letter -ceq $badge[0]){
            Write-Host $letter -NoNewLine -ForegroundColor Red
        }else{
            Write-Host $letter -NoNewLine
        }
    }
    Write-Host ''
    foreach($letter in $elfThree){
        if($letter -ceq $badge[0]){
            Write-Host $letter -NoNewLine -ForegroundColor Red
        }else{
            Write-Host $letter -NoNewLine
        }
    }
    Write-Host "`n"
}

$output