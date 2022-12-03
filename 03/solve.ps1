$data = Get-Content ./03/input.txt

$output = 0
$duplicates = @()

$count = 1
$valueMap = @{}

$lower = 97..122 | %{[char]$_}
$upper = 65..90 | %{[char]$_}

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
            $duplicates += $item
            $duplicateFound = $true
            break
        }
    }
    if($duplicateFound -eq $false){
        foreach($item in $secondHalf){
            if($firstHalf -ccontains $item){
                $duplicates += $item
                break
            }
        }
    }
}

foreach($uniqueLetter in $duplicates){
    $output += $valueMap[$uniqueLetter]
}

$output

$output = 0


for($i = 0; $i -le $data.length - 3; $i+=3){
    $elfOne = $data[$i].ToCharArray()
    $elfTwo = $data[$i+1].ToCharArray()
    $elfThree = $data[$i+2].ToCharArray()
    $badge = $elfOne | Where-Object {$_ -cin $elfTwo} | Where-Object {$_ -cin $elfThree}
    $badge
    $output += $valueMap[$badge[0]]
}

$output