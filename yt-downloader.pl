#!/usr/bin/perl

# -----------------------------------------------------------------------------
# Info:
#  author:    N-Cen-Dainamix
#  file:      yt-downloader.pl
#  created:   16/10/2019
#  version:   1.3.0 [for Termux Android]
# -----------------------------------------------------------------------------
# Requirements:
#  Perl, Python, cURL, ffmpeg, youtube-dl
# Description:
#  Youtube Automatic Converter Downloader for Termux
# -----------------------------------------------------------------------------

use strict;
my($menu);
&_menu;

if($menu eq '?'){
system('clear');
&_help;
print "\n-- You want back to downloader ? [y/n]: ";
chop($menu = <stdin>);
if($menu eq 'y'){
&_menu;
}
if($menu eq 'n'){
exit;
}
            }
if($menu eq '1'){
&_mp4_video;
}
if($menu eq '2'){
&_mp4_all;
}
if($menu eq '3'){
&_mp4_only;
}
if($menu eq '4'){
&_mp3_sound;
}
if($menu eq '5'){
&_mp3_all;
}
if($menu eq '6'){
&_mp3_only;
}
if($menu eq '0'){
exit;
}
if($menu eq '+'){
&_make_link;
}

sub _make_link{
my($file,$make);
print "-- Create text link --\n";
print "-- Finish enter link enter code: ok --\n";
print "-- File name: "; 
chop($file = <stdin>);
open my $outfile, ">", $file;
close($outfile);
while(<>){
chomp($_);
end()  if m/^ok()/gi;   
open $make, ">>", $file; 
print $make "$_\n";
} # end code make link
sub end{
close($make); 
print "\n-- Create finish link on file: $file\n";
exit;
}
             } # end code make link

sub _mp3_sound{
print "-- Endter link video: ";
chop(my $link = <stdin>);
system("youtube-dl -x --audio-format mp3 $link");
print "[successfully] finish work you want download more? [y/n] ";
chop(my $en = <stdin>);
if($en eq 'y'){
system('cls');
&_mp3_sound;
}
if($en eq 'n'){
exit;
}
             } #end code mp3_sound
sub _mp3_all{
print "-- Enter link playlist: ";
chop(my $link = <stdin>);
print "-- Enter number first video: ";
chop(my $f = <stdin>);
print "-- Enter number final video: ";
chop(my $e = <stdin>);
system("youtube-dl -x --audio-format mp3 --playlist-start $f --playlist-end $e $link");
}  # end code mp3_all

sub _mp3_only{
my(@senhas,$b,$senha2,$senhas);
print "-- Enter link file name: ";
chop(my $file = <stdin>);
open(a,"<$file");
@senhas = <a>;
$b = scalar(@senhas);
print "[info] read file: $file have $b link\n";
print "[list] @senhas\n";
for($a>0;$a<$b;$a++){
chomp($senha2 = $senhas[$a]);
print "[info] download: $senha2\n";
sleep 2;
system("youtube-dl -x --audio-format mp3 $senha2");
}
              }  # end code mp3_only

sub _mp4_video{
print "-- Enter link video: ";
chop(my $link = <stdin>);
system("youtube-dl -i -f mp4 $link");
print "[successfully] finish work you want download more? [y/n] ";
chop(my $en = <stdin>);
if($en eq 'y'){
system('cls');
&_mp4_video;
}
if($en eq 'n'){
exit;
}
              } # end code mp4_video
sub _mp4_all{
print "-- Enter link playlist: ";
chop(my $link = <stdin>);
print "-- Enter number first video: ";
chop(my $f = <stdin>);
print "-- Enter number final video: ";
chop(my $e = <stdin>);
system("youtube-dl -i -f mp4 --playlist-start $f --playlist-end $e $link");
} # end code mp4_all

sub _mp4_only{
my(@senhas,$b,$senha2,$senhas);
print "-- Enter link file name: ";
chop(my $file = <stdin>);
open(a,"<$file");
@senhas = <a>;
$b = scalar(@senhas);
print "[info] read file: $file have $b link\n";
print "[list] @senhas\n";
for($a>0;$a<$b;$a++){
chomp($senha2 = $senhas[$a]);
print "[info] download: $senha2\n";
sleep 2;
system("youtube-dl -i -f mp4 $senha2");
}
    } # end code mp4_only

sub _banner{
print q{+-------------------------------------------+
| Youtube Automatic Converter Downloader    |
| Version: 1.3.0 [for Termux Android]       |
| Update: 16/10/2019                        |
| Credit by: N-Cen-Dainamix                 |
| Contact: http://facebook.com/ncendainamix |
+-------------------------------------------+
(C) 2014 - 2019 by: Dainamix-Team
};
}

sub _menu{
&_banner;
print q{
-- Sample help & create text link
[?] Show all sample help
[+] Create a link file for download only what we need
[0] Exit go to termux
-- Menu item for video [mp4]
[1] Download video 
[2] Download all on playlist
[3] Download only what we need
-- Menu item for music [mp3]
[4] Download and converter sound
[5] Download all on playlist and sound converter
[6] Download only what we need and converter sound
};
print "\n-- Enter number: ";
chop($menu = <stdin>);
}

sub _help{
&_banner;
print q{
- How to download all on playlist
enter link playlist and number video start and video end you want
sample want first video number one final video four enter 1 and 4

- How to download video only what we need
create a new text file use menu + for easy to create link file
and enter link video only what we need
sample create file name link.txt enter three link on file
https://www.youtube.com/watch?v=AT2M_8E2yK0
https://www.youtube.com/watch?v=-L3qKTPLLPc
https://www.youtube.com/watch?v=7qw3NynVgMY
and enter the name list file link.txt
};
}
