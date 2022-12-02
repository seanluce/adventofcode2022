$data = Get-Content ./02/input.txt

$a = 1 #rock
$b = 2 #paper
$c = 3 #scissors

$x = 1 #lose
$y = 2 #draw
$z = 3 #win

$win = 6
$lose = 0
$draw = 3

$score = 0

foreach($row in $data){
    $opponent = $row.split(' ')[0]
    $me = $row.split(' ')[1]
    if($opponent -eq 'A' -and $me -eq 'Y'){
        $score += ($y + $win)
    }elseif($opponent -eq 'B' -and $me -eq 'Z'){
        $score += ($z + $win)
    }elseif($opponent -eq 'C' -and $me -eq 'X'){
        $score += ($x + $win)
    }elseif($opponent -eq 'A' -and $me -eq 'X'){
        $score += ($x + $draw)
    }elseif($opponent -eq 'B' -and $me -eq 'Y'){
        $score += ($y + $draw)
    }elseif($opponent -eq 'C' -and $me -eq 'Z'){
        $score += ($z + $draw)
    }elseif($opponent -eq 'A' -and $me -eq 'Z'){
        $score += $z
    }elseif($opponent -eq 'B' -and $me -eq 'X'){
        $score += $x
    }elseif($opponent -eq 'C' -and $me -eq 'Y'){
        $score += $y
    }
}

$score

$score = 0

foreach($row in $data){
    $opponent = $row.split(' ')[0]
    $outcome = $row.split(' ')[1]
    if($opponent -eq 'A' -and $outcome -eq 'Y'){
        $score += ($a + $draw)
    }elseif($opponent -eq 'B' -and $outcome -eq 'Z'){
        $score += ($c + $win)
    }elseif($opponent -eq 'C' -and $outcome -eq 'X'){
        $score += ($b + $lose)
    }elseif($opponent -eq 'A' -and $outcome -eq 'X'){
        $score += ($c + $lose)
    }elseif($opponent -eq 'B' -and $outcome -eq 'Y'){
        $score += ($b + $draw)
    }elseif($opponent -eq 'C' -and $outcome -eq 'Z'){
        $score += ($a + $win)
    }elseif($opponent -eq 'A' -and $outcome -eq 'Z'){
        $score += ($b + $win)
    }elseif($opponent -eq 'B' -and $outcome -eq 'X'){
        $score += ($a + $lose)
    }elseif($opponent -eq 'C' -and $outcome -eq 'Y'){
        $score += ($c + $draw)
    }
}

$score