Function Get-DirSize {
    param (
        $targetDirectory
    )
    $count = $directorySizes[$targetDirectory]
    foreach($directory in $directorySizes.Keys){
        if($directory -ne $targetDirectory -and $directory.StartsWith($targetDirectory)){
            $count += [int]$directorySizes[$directory]
            Get-DirSize -targetDirectory $directory
        }
        $recursiveSizes[$targetDirectory] = $count
    }
}

$data = Get-Content ./07/input.txt

$currentDir = '/'

$directorySizes = @{}

foreach($row in $data){
    if($row -like '$ cd*'){
        $nextDir = $row.split(' ')[2]
        $dirArray = @()
        if($nextDir -eq '..'){
            $dirArray = $currentDir.split('/')
            $currentDir = '/'
            if($dirArray.Length -gt 3){
                foreach($dir in $dirArray[1..($dirArray.Length-3)]){
                    $currentDir += $dir + '/'
                }
            }
        }elseif($nextDir -eq '/'){
            $currentDir = '/'
        }else{
            $currentDir += $nextDir + '/'
        }
        #$currentDir
    }elseif($row -eq '$ ls'){
        #
    }elseif($row -like 'dir*'){
        $emptyDir = $row.split(' ')[1]
        if($directorySizes[$currentDir + $emptyDir + '/']){
        }else{
            $directorySizes[$currentDir + $emptyDir + '/'] = 0
        }
    }else{
        $fileSize = $row.split(' ')[0]
        $directorySizes[$currentDir] = [int]$fileSize + [int]$directorySizes[$currentDir]
        #$row
    }
}

$recursiveSizes = @{}

$directorySizes
Get-DirSize -targetDirectory "/"

$recursiveSizes

$totalAtMost = 0

foreach($directory in $recursiveSizes.Keys){
    if([int]$recursiveSizes[$directory] -le 100000){
        Write-Host $directory $directorySizes[$directory] $recursiveSizes[$directory]
        $totalAtMost += [int]$recursiveSizes[$directory]
    }
}

$totalAtMost

# Part 2

$candidates = @()

Write-Host 'Total Consumed: '$recursiveSizes['/']
Write-Host 'Free Space: ' (70000000-[int]$recursiveSizes['/'])
Write-Host 'Required: ' (30000000-(70000000-[int]$recursiveSizes['/']))

foreach($directory in $recursiveSizes.Keys){
    if($recursiveSizes[$directory] -ge (30000000-(70000000-[int]$recursiveSizes['/']))){
        $candidates += $recursiveSizes[$directory]
    }
}

$candidates | Sort-Object