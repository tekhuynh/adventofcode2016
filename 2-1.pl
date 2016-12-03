

@pad = (
  [1,2,3],
  [4,5,6],
  [7,8,9]
);

%directions = (
  'R' => [ 0,  1],
  'D' => [ 1,  0],
  'L' => [ 0, -1],
  'U' => [-1,  0]
);

@position = (1, 1);
@ans = ();

while (chomp($line = <>)) {
  @moves = split '', $line;
  foreach $m (@moves) {
    $position[0] += $directions{$m}[0];
    $position[1] += $directions{$m}[1];
    
    $position[0] = 0 if $position[0] < 0;
    $position[1] = 0 if $position[1] < 0;
    $position[0] = 2 if $position[0] > 2;
    $position[1] = 2 if $position[1] > 2;
  }

  push @ans, $pad[$position[0]][$position[1]];
}
print join '', @ans, "\n";
