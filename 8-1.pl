

@screen = ();

while (chomp($line = <>)) {

  if ($line =~ /rect (\d+)x(\d+)/) {
    for $i (0..$2-1) {
      for $j (0..$1-1) {
        $screen[$i][$j] = '1';
      }
    }
  }

  if ($line =~ /rotate row y=(\d+) by (\d+)/) {
    my @new = ();
    for $i (0..49) {
      $rot = ($i + $2) % 50;
      $new[$rot] = $screen[$1][$i];
    }
    $screen[$1] = \@new;
  }

  if ($line =~ /rotate column x=(\d+) by (\d+)/) {
    my @new = ();
    for $i (0..5) {
      $rot = ($i + $2) % 6;
      $new[$rot] = $screen[$i][$1];
    }
    for $i (0..5) {
      $screen[$i][$1] = $new[$i];
    }
  }

  for $i (0..5) {
    for $j (0..49) {
      print $screen[$i][$j] ? '#' : '.';
    }
    print "\n";
  }
  print "\n";
}

for $i (0..5) {
  for $j (0..49) {
    print $screen[$i][$j] ? '#' : '.';
    $count++ if $screen[$i][$j];
  }
  print "\n";
}
print $count,"\n";

