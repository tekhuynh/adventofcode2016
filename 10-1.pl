use Data::Dumper;
@inst = <>;
@inst = sort @inst;

%data = ();
%output = ();

for $line (@inst) {
  if ($line =~ /^bot (\d+).* (\w+) (\d+).* (\w+) (\d+)/) {
    print ("$1 $2 $3 $4 $5\n");
    if ($2 eq "bot") {
      $data{$1}{"low"} = $3;
    } else {
      $data{$1}{"low"} = "output ".$3;
    }
    if ($4 eq "bot") {
      $data{$1}{"high"} = $5;
    } else {
      $data{$1}{"high"} = "output ".$5;
    }
  } elsif ($line =~ /^value (\d+) .* (\d+)/) {
    print "value $1 to  $2\n";
    insert($1, $2);
  }
}

for $k (keys %data) {
  #print "bot $k: low = $data{$k}{'low'}, high = $data{$k}{'high'}, $data{$k}{'l'} $data{$k}{'h'}\n";
}

sub insert {
  my $val = shift;
  my $bot = shift;

  if ($bot =~ /output/) {
    print "$bot $val\n";
    return;
  }

  if (not defined $data{$bot}{"l"}) {
    $data{$bot}{"l"} = $val;
  } else {
    if ($data{$bot}{"l"} <= $val) {
      $data{$bot}{"h"} = $val;
    } else {
      $data{$bot}{"h"} = $data{$bot}{"l"};
      $data{$bot}{"l"} = $val;
    }
    #print "bot is $bot\n" if ($data{$bot}{"l"} == 17 and $data{$bot}{"h"} == 61);
    insert($data{$bot}{"l"}, $data{$bot}{"low"});
    insert($data{$bot}{"h"}, $data{$bot}{"high"});
  }
}
