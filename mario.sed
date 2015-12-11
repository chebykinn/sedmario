#!/usr/bin/sed -Enf
# Sed Mario Bros
# 10th of December, 2015
# (C) Ivan Chebykin <ivan4b69@gmail.com>

#map keys, down actually is not used
/^a/b left
/^d/b right
/^ /b up
/^s/b down

/^\[D/b left
/^\[C/b right
/^\[A/b up
/^\[B/b down

/q/q

# If screen is empty - print initial map, 2 first rows for header bar
:print
g
 /^$/ { s/.*/\
+--------------------------------+\
IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII\
IIIIIIIIIIIIx00IIIIIIIIIIIIIIIIIII\
|FFFFFFFFFFFFFFFFFFFFFFXFFFFFFFFFFFFFFFFFFFFFFFFF1\
|FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2\
|FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3\
|FFFFFFFFFFFFFFFFXFFFSXSXSFFFFFFFFFFFFFFFFFFFTFFF4\
|FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFTFFFFFFTFFF5\
|FFFFPFFFFFFFFFFFFFFFFFFFFFMFTFFFFFFFFTFFFMFFTFFF6\
|SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS7\
|SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS8\
+--------------------------------+\
 /
 }
# If no key is pressed
:none
 b end
:left
 g
 s/FP/PF/
 b end
:right
 g
 # Prevent screen scrolling at the end of level
 /end/b end
 s/PF/FP/
 #Check if played is close to border of scroll buffer
 /P(([FSTCBAHXMGKODE#]){16,32})[0-9]/ {
    s/\|(([FSTCBAHXMGKODE]){1})/|/g
    s/([FSTCBAHXMGKODE#])([0-9])/\1#\2/g
    #Detect zone and load next to the scroll buffer
    /P([FSTCBAHXMGKODE]){1,17}#*[0-9]/ {
     /z/ !{
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFFFFFFTFFFFFFFF\1/
      s/#*(5\n)/FFFFFFFTFFFFFFFF\1/
      s/#*(6\n)/FMFFMFFTFFFFFFFF\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/$/z1 /
      b cls
     }
     /z1 / {
      s/#*(1\n)/FFFFFFFFFFFFFFMF\1/
      s/#*(2\n)/FFFFFFFFFFFFFSSS\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFFFFFFFFFSXSFFF\1/
      s/#*(5\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(6\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(7\n)/SSFFSSSSSSSSSSSS\1/
      s/#*(8\n)/SSFFSSSSSSSSSSSS\1/
      s/z1 /z2 /
      b cls
     }
     /z2 / {
      s/#*(1\n)/MFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/SSSSSFFFSSSSXFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFFFFFFFFFFFSFFF\1/
      s/#*(5\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(6\n)/FFFFFFFFFFFFFMFM\1/
      s/#*(7\n)/SSSFFFSSSSSSSSSS\1/
      s/#*(8\n)/SSSFFFSSSSSSSSSS\1/
      s/z2 /z3 /
      b cls
     }
     /z3 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFXFFFFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FSSFFFFXFXFXFFFF\1/
      s/#*(5\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(6\n)/FFFFFFFKFFFFMFMF\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/z3 /z4 /
      b cls
     }
     /z4 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFSSSFFFFSXXSF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FSFFFFFFFFFFSSFF\1/
      s/#*(5\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(6\n)/FFFFFFFMFMFFMFMF\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/z4 /z5 /
      b cls
     }
     /z5 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFFFCFFCFFFFFFFF\1/
      s/#*(5\n)/FFFCCFFCCFFFFFFF\1/
      s/#*(6\n)/FFCCCFFCCCFFFFFF\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/z5 /z6 /
      b cls
     }
     /z6 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFCCFFCFFFFFFFFF\1/
      s/#*(5\n)/FCCCFFCCFFFFFFFF\1/
      s/#*(6\n)/CCCCFFCCCFFFFFTF\1/
      s/#*(7\n)/SSSSFFSSSSSSSSSS\1/
      s/#*(8\n)/SSSSFFSSSSSSSSSS\1/
      s/z6 /z7 /
      b cls
     }
     /z7 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFSSXSFFFFFFFFFF\1/
      s/#*(5\n)/FFFFFFFFFFFFFFFC\1/
      s/#*(6\n)/FFFFFFFMFMFTFCCC\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/z7 /z8 /
      b cls
     }
     /z8 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFFFFAFFF\1/
      s/#*(3\n)/FFFCCFFFFFFFEFFF\1/
      s/#*(4\n)/FCCCCFFFFFFFEFFF\1/
      s/#*(5\n)/CCCCCFFFFFFFEFFF\1/
      s/#*(6\n)/CCCCCFFFFFFFCFFF\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/z8 /z9 /
      b cls
     }
     /z9 / {
      s/#*(1\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(2\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(3\n)/FFFFFFFFFFFFFFFF\1/
      s/#*(4\n)/FFFBBBFFFFFFFFFF\1/
      s/#*(5\n)/FFBBBBBFFFFFFFFF\1/
      s/#*(6\n)/FFBBHBBFFFFFFFFF\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      s/z9 /z10 /
      b cls
     }
     /z/ {
      s/#*(1\n)/FFFFFFFSSSSSSSSS\1/
      s/#*(2\n)/FFFFFFFSSSSSSSSS\1/
      s/#*(3\n)/FFFFFFFSSSSSSSSS\1/
      s/#*(4\n)/FFFFFFFSSSSSSSSS\1/
      s/#*(5\n)/FFFFFFFSSSSSSSSS\1/
      s/#*(6\n)/FFFFFFFSSSSSSSSS\1/
      s/#*(7\n)/SSSSSSSSSSSSSSSS\1/
      s/#*(8\n)/SSSSSSSSSSSSSSSS\1/
      b cls
     }
    }
 }
 b end
:up
 g
 # Special tags check, that prevents us from jumping in the air
 /(1|2|3)u/ !{
    /P(.{50})F/ !{
        s/F(.{50})P/P\1F/
        s/$/1u/
    }
 }
 b cls
:down
 g
 b end
:end

:score
# If player hit the orange box, we increment score
/X(.{50})P/{
    s/X(.{50})P/D\1P/
    :incr
    s/9(d*)I/d\1I/;t incr
    s/x(d*)I/x0\1I/
    s/8(d*)I/9\1I/
    s/7(d*)I/8\1I/
    s/6(d*)I/7\1I/
    s/5(d*)I/6\1I/
    s/4(d*)I/5\1I/
    s/3(d*)I/4\1I/
    s/2(d*)I/3\1I/
    s/1(d*)I/2\1I/
    s/0(d*)I/1\1I/
    s/d/0/g
}
# When enemy hits the wall it *should* change direction
:enemies
s/F(M|K)/\1F/g
s/(G|O)F/F\1/g
/(P(M|K))|((G|O)P)/!{
 /FM/!s/M/G/
 /GF/!s/G/M/
 /FK/!s/K/O/
 /OF/!s/O/K/
}
# Prevents enemies from moving into wall
/FMM/s/FMM/MFM/
/MMF/s/MMF/GFG/
/GGF/s/GGF/GFG/
/FGG/s/FGG/MFM/
/KKF/s/KKF/KFK/
/FKK/s/FKK/OFO/
/OOF/s/OOF/OFO/
/FOO/s/FOO/KFK/

# If player crossed flagpole, we start ending
:endlevel
 /FPEF/{
  s/$/end/
  s/FPEF/FFPF/
  s/(E|A)/F/g
 }
 # Move player into castle
 /end/{
  /FPBB/!{
    s/PF/FP/;t check
  }
  /FPBB/{
    s/FPBB/FFPB/;t check
  }
  /PB/{
    s/PB/BP/;t check
  }
  /PH/{
    s/P/B/;t check
  }
  s/x[0-9]{2}/x99/
  s/$/endmsg/

 }

:check
 #If player hits enemies he will be removed
 s/P(M|K)/\1F/
 s/(G|O)P/F\1/
 /(1|2)u/ !{
    # Check if player is in the sky
    /P(.{50})F/ {
        s/P(.{50})F/F\1P/
        s/3u//
        b cls
    }
    /P(.{50})B/ {
        s/P(.{50})B/B\1P/
        b cls
    }

    # If player is above Gooba kill him and increment score
    /P(.{50})M/ {
        s/P(.{50})M/F\1P/;t incr
        b cls
    }
    /P(.{50})G/ {
        s/P(.{50})G/F\1P/;t incr
        b cls
    }

    # Same with Koopa
    /P(.{50})K/ {
        s/P(.{50})K/F\1P/;t incr
        b cls
    }
    /P(.{50})O/ {
        s/P(.{50})O/F\1P/;t incr
        b cls
    }

    # If someone fell into hole - delete him
    s/[PMGKO](.{50})-/F\1-/g
    #If mobs are above ground - move them down
    s/([MGKO])(.{50})F/F\2\1/g
 }
 # Check the stage of jumping, and move player higher
 /(1|2|3)u/ {
    s/F(.{50})P/P\1F/
    s/2u/3u/
    s/1u/2u/
    b cls
 }

/P/ !{
    /end/ !{
        s/$/died/
    }
}

:cls
 # Saving to the hold buffer, after that all is left are post-effects.
 h

 # Hide offscreen buffer
 s/([FSTCBAHXMGKODE#]){16}([0-9])/|/g
 # Hide zone
 s/z[0-9]* //
 # Hide jump stage
 s/[1-3]u//
 # Add colors to blocks
 # Sky
 s/F/\[48;5;27m \[0m/g
 # Brick
 s/S/\[48;5;130m \[0m/g
 # Pipe
 s/T/\[48;5;34m \[0m/g
 # Player
 s/P/\[48;5;160m \[0m/g
 # Stairs
 s/C/\[48;5;52m \[0m/g
 # Castle
 s/B/\[48;5;124m \[0m/g
 # Flag
 s/A/\[48;5;40m \[0m/g
 # Black block (castle door)
 s/H/ /g
 # Score block
 s/X/\[48;5;208m \[0m/g
 # Little Goomba
 s/(M|G)/\[48;5;88m \[0m/g
 # Koopa Troopa
 s/(K|O)/\[48;5;76m \[0m/g
 # Empty score block
 s/D/\[48;5;137m \[0m/g
 # Flagpole
 s/E/\[48;5;27m|\[0m/g
 # Here we prepare header by adding labels and sky blocks
 # After that we should perform coloring again
 s/\nI{34}\nI{12}x([0-9])([0-9])I{19}/\
|FFFMARIOFFFFFFFFFFWORLDFFTIMEFFF|\
|FFF0\200\10FFXx\1\2FFFF1-1FFFF360FFF|/
 s/F/\[48;5;27m \[0m/g
 s/X/\[48;5;214m \[0m/g
 s/(MARIO|WORLD|TIME|[0-9]{6}|x[0-9]{2}|1-1|360)/\[48;5;27m\1\[0m/g
 s/MARIO/\[48;5;27mMARIO\[0m/g
 s/end//
 # Clear screen
 i\
 [2J[H
 # Print end message
 /endmsg/{
  s/endmsg$/THANK YOU MARIO!\nYOUR QUEST IS OVER.\
WE PRESENT YOU A NEW QUEST.\n\nPLAY AGAIN/
 p;q
 }
 
 /died/{
    s/died$/SORRY MARIO!\nGAME OVER.\nTRY AGAIN./
    p;q
 }
 p
