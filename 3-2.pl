$count = 0;
while (chomp($line = <>)) {
  @numbers = $line =~ /(\d+)/g;
  push @t, $numbers[0];
  push @u, $numbers[1];
  push @v, $numbers[2];
}

$count = 0;
@newnumbers = (join ' ', @t, @u, @v) =~ /(\d+ \d+ \d+)/g;

for $line (@newnumbers) {
  @numbers = $line =~ /(\d+)/g;
  @numbers = sort { $a <=> $b } @numbers;
  $count++ if $numbers[0] + $numbers[1] > $numbers[2];
}

print $count, "\n";
