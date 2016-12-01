
chomp($line = <>);

@move = split ", ", $line;
@directions = (
  [ 0,  1],
  [ 1,  0],
  [ 0, -1],
  [-1,  0]
);
$direction = 0;
@position = (0, 0);
%visited = ();
$visited{"@position"}++;
@hq;

foreach $m (@move) {

  ($turn, $blocks) = $m =~ /^([RL])(\d+)$/;
  if ($turn eq "L") {
    $direction = ($direction + 4 - 1) % 4;
  } else {
    $direction = ($direction + 1) % 4;
  }

  foreach $i (1..$blocks) {
    $position[0] += $directions[$direction][0];
    $position[1] += $directions[$direction][1];

    if (not @hq) {
      $visited{"@position"}++;
      @hq = @position if $visited{"@position"} == 2;
    }
  }
}

print "Part1: ";
print abs($position[0]) + abs($position[1]);
print "\n";
print "Part2: ";
print abs($hq[0]) + abs($hq[1]);
print "\n";
