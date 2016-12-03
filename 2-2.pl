

@pad = (
  [0,0,1,0,0],
  [0,2,3,4,0],
  [5,6,7,8,9],
  [0,'A','B','C',0],
  [0,0,'D',0,0],
);

%directions = (
  'R' => [ 0,  1],
  'D' => [ 1,  0],
  'L' => [ 0, -1],
  'U' => [-1,  0]
);

@pos = (2, 0);
@ans = ();

while (chomp($line = <>)) {
  @moves = split '', $line;
  foreach $m (@moves) {

    @position = @pos;

    $position[0] += $directions{$m}[0];
    $position[1] += $directions{$m}[1];

    $position[0] = 0 if $position[0] < 0;
    $position[1] = 0 if $position[1] < 0;
    $position[0] = 4 if $position[0] > 4;
    $position[1] = 4 if $position[1] > 4;

    @pos = @position if $pad[$position[0]][$position[1]];

  }

  push @ans, $pad[$pos[0]][$pos[1]];
}

print join '', @ans, "\n";
