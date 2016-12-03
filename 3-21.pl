while (chomp($line = <>)) {
  @numbers = $line =~ /(\d+)/g;
  push @t, $numbers[0];
  push @u, $numbers[1];
  push @v, $numbers[2] }
for $line ((join ' ', @t, @u, @v) =~ /(\d+ \d+ \d+)/g) {
  @numbers = sort { $a <=> $b } ($line =~ /(\d+)/g);
  $count++ if $numbers[0] + $numbers[1] > $numbers[2] }
print $count, "\n";
