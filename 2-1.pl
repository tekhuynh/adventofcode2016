

@pad = (
  [1,2,3],
  [4,5,6],
  [7,8,9]
);

@directions = (
  [ 0,  1],
  [ 1,  0],
  [ 0, -1],
  [-1,  0]
);

@position = (1, 1);
@ans = ();

while ($line = <>) {
  chomp($line);
  @moves = split '', $line;
  foreach $m (@moves) {
    if ($m eq 'U') {

      $position[0] += $directions[3][0];
      $position[1] += $directions[3][1];

    } elsif ($m eq 'D') {

      $position[0] += $directions[1][0];
      $position[1] += $directions[1][1];

    } elsif ($m eq 'L') {

      $position[0] += $directions[2][0];
      $position[1] += $directions[2][1];

    } elsif ($m eq 'R') {

      $position[0] += $directions[0][0];
      $position[1] += $directions[0][1];

    }
    
    $position[0] = 0 if $position[0] < 0;
    $position[1] = 0 if $position[1] < 0;
    $position[0] = 2 if $position[0] > 2;
    $position[1] = 2 if $position[1] > 2;
  }

  push @ans, $pad[$position[0]][$position[1]];
}
print join '', @ans, "\n";
