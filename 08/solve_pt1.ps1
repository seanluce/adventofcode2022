$data = Get-Content ./08/input.txt

$left2rightVisible = 0
$right2leftVisible = 0

$counted = @()
$rowCount = 0

foreach($row in $data){
    $treeRow = @()
    $tempRow = $row.ToCharArray()
    foreach($tree in $tempRow){
        $treeRow += $tree
    }
    $counted += , $treeRow
    $rowLength = $tempRow.Length - 1
    $left2rightVisible += 1
    $counted[$rowCount][0] = 'X'
    $maxTreeHeight = [int]$tempRow[0]
    for($tree = 1; $tree -le $rowLength; $tree++){
        if([int]$tempRow[$tree] -gt $maxTreeHeight){
            if($counted[$rowCount][$tree] -ne 'X'){
                $left2rightVisible += 1
                $counted[$rowCount][$tree] = 'X'
            }
            $maxTreeHeight = [int]$tempRow[$tree]
        }
    }
    if($counted[$rowCount][$rowLength] -ne 'X'){
        $right2leftVisible += 1
        $counted[$rowCount][$rowLength] = 'X'
    }
    $maxTreeHeight = [int]$tempRow[$rowLength]
    for($tree = $rowLength; $tree -ge 0; $tree--){
        if([int]$tempRow[$tree] -gt $maxTreeHeight){
            if($counted[$rowCount][$tree] -ne 'X'){
                $right2leftVisible += 1
                $counted[$rowCount][$tree] = 'X'
            }
            $maxTreeHeight = [int]$tempRow[$tree]
        }
    }
    $rowCount += 1
}

Write-Host 'Left 2 Right Visible: '$left2rightVisible
Write-Host 'Right 2 Left Visible: '$right2leftVisible



$column = 0

$columnMaxTreeHeight = @()
$top2BottomVisible = 0
$bottom2topVisible = 0


foreach($row in $data[0]){
    $column = 0
    $rowArray = $row.ToCharArray()
    foreach($tree in $rowArray){
        $columnMaxTreeHeight += 0
        if($counted[0][$column] -ne 'X'){    
            $top2BottomVisible += 1
            $counted[0][$column] = 'X'
        }
    }
    $column += 1
}

$rowCount = 0

foreach($row in $data){
    $column = 0
    $treeRow = $row.ToCharArray()
    foreach($tree in $treeRow){
        if($tree -gt $columnMaxTreeHeight[$column]){
            $columnMaxTreeHeight[$column] = $tree
            if($counted[$rowCount][$column] -ne 'X'){
                $top2bottomVisible += 1
                $counted[$rowCount][$column] = 'X'
            }
        }elseif($tree -lt $columnMaxTreeHeight[$column]){
            #break
        }
        $column += 1
    }
    $rowCount += 1
}

$lastRow = @()

$column = 0
$columnMaxTreeHeight = @()

foreach($row in $data[$data.Length-1]){
    $rowArray = $row.ToCharArray()
    foreach($tree in $rowArray){
        $lastRow += $tree
        $columnMaxTreeHeight += 0
        if($counted[$data.Length-1][$column] -ne 'X'){
            $counted[$data.Length-1][$column] = 'X'
            $bottom2topVisible += 1
        }
        $column += 1
    }
}

$rowCount = 0

$reverseData = @()

for($f = $data.Length-1; $f -ge 0; $f--){
    $reverseData += $data[$f]
}

$rowCount = $data.Length-1
foreach($row in $ReverseData){
    $column = 0
    $treeRow = $row.ToCharArray()
    foreach($tree in $treeRow){
        if($tree -gt $columnMaxTreeHeight[$column]){
            $columnMaxTreeHeight[$column] = $tree
            if($counted[$rowCount][$column] -ne 'X'){
                $bottom2topVisible += 1
                $counted[$rowCount][$column] = 'X'
            }
        }elseif($tree -lt $columnMaxTreeHeight[$column]){
            #break
        }
        $column += 1
    }
    $rowCount -= 1
}



Write-Host 'Top 2 Bottom Visible:'$top2BottomVisible
Write-Host 'Column Max Tree Height:'$columnMaxTreeHeight
Write-Host 'Last Row:'$lastRow
Write-Host 'Bottom 2 Top Visible:'$bottom2topVisible

foreach($row in $counted){
    $row -join ''
}


$totalVisible = $left2rightVisible + $right2leftVisible + $top2BottomVisible + $bottom2topVisible

$totalVisible