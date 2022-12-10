$data = Get-Content ./08/input.txt

$gridWidth = 98
$gridHeight = 98
$scenicScores = @{}

for($y=1; $y -le $gridHeight-1; $y++){
    for($x=1; $x -le $gridWidth-1; $x++){
        $position = [string]$x + ',' + [string]$y
        Write-Host 'Position: '$position
        $currentHeight = $data[$y][$x]
        Write-Host 'Current Height is: '$currentHeight
        
        #look north
        $viewNorth = 0
        $maxHeight = 0
        $lookNorth = $y
        while($lookNorth -gt 0 -and $maxHeight -lt $currentHeight){
                $maxHeight = $data[$lookNorth-1][$x]
                $viewNorth++
            $lookNorth--
        }
        Write-Host 'View Distance North: '$viewNorth
        
        #look south
        $viewSouth = 0
        $maxHeight = 0
        $lookSouth = $y
        while($lookSouth -lt $gridHeight -and $maxHeight -lt $currentHeight){
                $maxHeight = $data[$lookSouth+1][$x]
                $viewSouth++
            $lookSouth++
        }
        Write-Host 'View Distance South: '$viewSouth

        #look east
        $viewEast = 0
        $maxHeight = 0
        $lookEast = $x
        while($lookEast -lt $gridWidth -and $maxHeight -lt $currentHeight){
                $maxHeight = $data[$y][$lookEast+1]
                $viewEast++
            $lookEast++
        }
        Write-Host 'View Distance East: '$viewEast

        #look west
        $viewWest = 0
        $maxHeight = 0
        $lookWest = $x #2
        while($lookWest -gt 0 -and $maxHeight -lt $currentHeight){
                $maxHeight = $data[$y][$lookWest-1]
                $viewWest++
            $lookWest--
        }
        Write-Host 'View Distance West: '$viewWest

        ###
        # Calculate Scenic Score for this tree and send to hash table
        $scenicScores[$position] = $viewNorth * $viewEast * $viewSouth * $viewWest
        #
        ###
    }
}

$scenicScores.GetEnumerator() | Sort-Object Value